#!/usr/bin/env python
'''
This script uses GitHub API to construct http_archive element to be inserted
into a federation client projects bazel WORKSPACE
'''
import hashlib
import json
import urllib3

urllib3.disable_warnings()

HTTP_ARCHIVE_TEMPLATE = """    http_archive(
      name = "{}",  # {}
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "{}",
           "{}"
      ],
      strip_prefix = "{}-{}",
      sha256 = "{}",
    )"""

http = urllib3.PoolManager()


class ExternalDependency(object):
  def workspace_rule(self):
    raise NotImplementedError('must implement workspace_rule()')


class GitHubProject(ExternalDependency):
  def __init__(self, name, owner, repo):
    self.name = name
    self.owner = owner
    self.repo = repo

  def workspace_rule(self):
    # https://developer.github.com/v3/repos/commits/
    request = http.request(
        'GET', 'https://api.github.com/repos/{}/{}/commits'.format(
            project.owner, project.repo),
        headers = { 'User-Agent': 'Workspace Updater' })
    response = json.loads(request.data.decode('utf-8'))
    commit = response[0]["sha"]
    date = response[0]["commit"]["committer"]["date"]
    url = 'https://github.com/{}/{}/archive/{}.zip'.format(
        project.owner, project.repo, commit)
    request = http.request('GET', url,
                           headers = { 'User-Agent': 'Workspace Updater' })
    sha256 = hashlib.sha256(request.data).hexdigest()
    return HTTP_ARCHIVE_TEMPLATE.format(project.name, date, url, url,
                                        project.repo, commit, sha256)


PROJECTS = [
    GitHubProject('rules_cc', 'bazelbuild', 'rules_cc'),
    GitHubProject('rules_python', 'bazelbuild', 'rules_python'),
    GitHubProject('com_google_absl', 'abseil', 'abseil-cpp'),
    GitHubProject('com_google_googletest', 'google', 'googletest'),
    GitHubProject('com_github_google_benchmark', 'google', 'benchmark'),
    GitHubProject('com_github_google_tcmalloc', 'google', 'tcmalloc'),
]


print("\"\"\"Expose federation components as .bzl file to be loaded \"\"\"")
print("")
print("load(\"@bazel_tools//tools/build_defs/repo:http.bzl\", \"http_archive\")")
print("")
print ("def federation_deps():")

for project in PROJECTS:
  retVal=project.workspace_rule()
  print ("    # ********** " +project.name + " *****************")
  print (retVal)
  print("")

print("    # ********** zlib (pinned to 1.2.11) *****************")
print("    http_archive(")
print("      name = \"net_zlib\",")
print("      build_file = \"@com_google_absl_oss_federation//:zlib.BUILD\",")
print("      sha256 = \"c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1\",")
print("      strip_prefix = \"zlib-1.2.11\",")
print("      # Use the same URL twice to trick bazel into re-trying if connection fails")
print("      urls = [")
print("          \"https://zlib.net/zlib-1.2.11.tar.gz\",")
print("          \"https://zlib.net/zlib-1.2.11.tar.gz\"")
print("      ],")
print("    )")
