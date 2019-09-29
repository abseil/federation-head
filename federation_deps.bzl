"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    http_archive(
        name = "rules_cc",
        strip_prefix = "rules_cc-master",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/master.zip"],
    )

    http_archive(
        name = "rules_python",
        strip_prefix = "rules_python-master",
        urls = ["https://github.com/bazelbuild/rules_python/archive/master.zip"],
    )

# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/502efe6d7841bff82b1aeef5500491fe9a48c635.zip"],  # 2019-09-25T19:12:18Z
      strip_prefix = "abseil-cpp-502efe6d7841bff82b1aeef5500491fe9a48c635",
      sha256 = "e7ca685b1ba7f7ab3bc6fc0f901dfcac0e2ab96cd583c3ace88d9c09ca8d0757",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/72adf7a4155b6642da1e6761678fe546590c0269.zip"],  # 2019-09-27T20:48:42Z
      strip_prefix = "googletest-72adf7a4155b6642da1e6761678fe546590c0269",
      sha256 = "4a57fd68265d11fed174ccfe88039472df067a4ff8423b61db8798024d7459e4",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/b8bce0c7ed4e02426fa4de21fec385fbaa84a7b2.zip"],  # 2019-09-27T11:09:23Z
      strip_prefix = "benchmark-b8bce0c7ed4e02426fa4de21fec385fbaa84a7b2",
      sha256 = "06601ff8df8f3121b53053c5acdea69cf8a3f5cd2ae46097599369c98e6babbf",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
