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
      urls = ["https://github.com/abseil/abseil-cpp/archive/9ddac555b7861dc178d0dbe758a1cfbed718784b.zip"],  # 2019-09-03T17:56:56Z
      strip_prefix = "abseil-cpp-9ddac555b7861dc178d0dbe758a1cfbed718784b",
      sha256 = "412096a9624593d069a386c9a75d64dba26cbf19da8c69c98d6aceb1b40f239e",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/565f1b848215b77c3732bca345fe76a0431d8b34.zip"],  # 2019-08-29T14:52:57Z
      strip_prefix = "googletest-565f1b848215b77c3732bca345fe76a0431d8b34",
      sha256 = "7d07068cf7c62f56bce58c98a606b756a6670a19241c12dd856a83ee3481ad72",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/7ee72863fdb1ccb2af5a011250b56af3f49b7511.zip"],  # 2019-08-21T21:12:03Z
      strip_prefix = "benchmark-7ee72863fdb1ccb2af5a011250b56af3f49b7511",
      sha256 = "85bf03b34280462cff7afb410357b8e97e1a65154dd4e0ee19fa600aa38cf2c0",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
