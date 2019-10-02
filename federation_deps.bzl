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
      urls = ["https://github.com/abseil/abseil-cpp/archive/8fe7214fe2d7a45ecc4d85f6a524c6b1532426de.zip"],  # 2019-10-01T17:58:29Z
      strip_prefix = "abseil-cpp-8fe7214fe2d7a45ecc4d85f6a524c6b1532426de",
      sha256 = "a5621afafe0ba064b6ddfc6a9c50a432e5dac15b0b2886131ba2a079c7df9f35",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/dc1ca9ae4c206434e450ed4ff535ca7c20c79e3c.zip"],  # 2019-09-29T19:30:31Z
      strip_prefix = "googletest-dc1ca9ae4c206434e450ed4ff535ca7c20c79e3c",
      sha256 = "d8376d6283e15ffd317646052233c88e2044cd61453619315e6fc139dc1b5d76",
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
