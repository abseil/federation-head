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
      urls = ["https://github.com/abseil/abseil-cpp/archive/e9f9000c7c80993cb589d011616b7a8016e42f4a.zip"],  # 2019-10-10T20:51:23Z
      strip_prefix = "abseil-cpp-e9f9000c7c80993cb589d011616b7a8016e42f4a",
      sha256 = "a46a011a8bd648072f83e4fc9e9c874f51ccfe7f9c6e58856bc2a6caf1a28dab",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/58c71977611c0019cf077e43fb54bc3326409a43.zip"],  # 2019-10-10T13:48:24Z
      strip_prefix = "googletest-58c71977611c0019cf077e43fb54bc3326409a43",
      sha256 = "98d32d8a2f9288e7d15892940694275d6bf87d50d5b8b1b4215c6be7c70d2dd2",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/309de5988eb949a27e077a24a1d83c0687d10d57.zip"],  # 2019-10-08T10:09:51Z
      strip_prefix = "benchmark-309de5988eb949a27e077a24a1d83c0687d10d57",
      sha256 = "8b18e7aa27fb2bc04704d5439558753cdbd2f5aa069996e7295e19d396699b38",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
