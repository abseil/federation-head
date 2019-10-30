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
      urls = ["https://github.com/abseil/abseil-cpp/archive/078b89b3c046d230ef3ad39494e5852184eb528b.zip"],  # 2019-10-24T14:29:13Z
      strip_prefix = "abseil-cpp-078b89b3c046d230ef3ad39494e5852184eb528b",
      sha256 = "3a373854bcb2bde29ed26f365edfda2cee07c41968a548b850d62cbd61c3163c",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/ba33a8876c3eda4cb8def8e0e90f45930ef8c54f.zip"],  # 2019-10-29T20:51:58Z
      strip_prefix = "googletest-ba33a8876c3eda4cb8def8e0e90f45930ef8c54f",
      sha256 = "fd29945e80388d7337f8f53963e73c34b7588b9d255ce608f6858f14bd7abb33",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/cf446a18bf37d5cc9b116f59cf9e6a9be89e58cc.zip"],  # 2019-10-24T19:13:03Z
      strip_prefix = "benchmark-cf446a18bf37d5cc9b116f59cf9e6a9be89e58cc",
      sha256 = "ff01751c5dfe310b4f6f77a7ea689fd918b7bd4ac0020ca88e4ce7084657d6a4",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
