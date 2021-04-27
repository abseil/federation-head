"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2021-04-01T09:45:57Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/c612c9581b9e740a49ed4c006edb93912c8ab205.zip",
           "https://github.com/bazelbuild/rules_cc/archive/c612c9581b9e740a49ed4c006edb93912c8ab205.zip"
      ],
      strip_prefix = "rules_cc-c612c9581b9e740a49ed4c006edb93912c8ab205",
      sha256 = "1bef6433ba1a4288b5853dc0ebd6cf436dc1c83cce6e16abf73e7ad1b785def4",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2021-04-23T03:38:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/1b4f61b15079d447bb7f8d11894824835e792e6c.zip",
           "https://github.com/bazelbuild/rules_python/archive/1b4f61b15079d447bb7f8d11894824835e792e6c.zip"
      ],
      strip_prefix = "rules_python-1b4f61b15079d447bb7f8d11894824835e792e6c",
      sha256 = "99d974fe9e1d3f421aad9fbee69511f626af0762c2c980cbef34449751f0e8b6",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-23T15:49:16Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/d96e287417766deddbff2d01b96321288c59491e.zip",
           "https://github.com/abseil/abseil-cpp/archive/d96e287417766deddbff2d01b96321288c59491e.zip"
      ],
      strip_prefix = "abseil-cpp-d96e287417766deddbff2d01b96321288c59491e",
      sha256 = "7192966b3ca413e7f7f141fac24725571d457f608cb3fc1182167006f50f5155",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-26T18:07:25Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/252ce9c52d304659eff6be558209c811b7191963.zip",
           "https://github.com/google/googletest/archive/252ce9c52d304659eff6be558209c811b7191963.zip"
      ],
      strip_prefix = "googletest-252ce9c52d304659eff6be558209c811b7191963",
      sha256 = "4b8eee57ff7afdd797ea52b8c50a8f572e6582ab00a4a932fb9117d14b423f93",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-04-26T17:26:33Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/86da5ec294d09842f93fadb391d91f59709b7269.zip",
           "https://github.com/google/benchmark/archive/86da5ec294d09842f93fadb391d91f59709b7269.zip"
      ],
      strip_prefix = "benchmark-86da5ec294d09842f93fadb391d91f59709b7269",
      sha256 = "4cace4ce60f937168aca31459f25a85ac1b5287d2328d76913b29d02e83aa643",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-23T17:48:02Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/5200f10aa521542acf6dba8f184522805d4191d3.zip",
           "https://github.com/google/tcmalloc/archive/5200f10aa521542acf6dba8f184522805d4191d3.zip"
      ],
      strip_prefix = "tcmalloc-5200f10aa521542acf6dba8f184522805d4191d3",
      sha256 = "4a901b04fa34365198211e9bd7070909beb02d395bf09a78742db6aa692c1823",
    )

    # ********** zlib (pinned to 1.2.11) *****************
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      # Use the same URL twice to trick bazel into re-trying if connection fails
      urls = [
          "https://zlib.net/zlib-1.2.11.tar.gz",
          "https://zlib.net/zlib-1.2.11.tar.gz"
      ],
    )
