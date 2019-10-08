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
      urls = ["https://github.com/abseil/abseil-cpp/archive/25597bdfc148e91e27678ec30efa52f4fc8c164f.zip"],  # 2019-10-03T16:32:02Z
      strip_prefix = "abseil-cpp-25597bdfc148e91e27678ec30efa52f4fc8c164f",
      sha256 = "c872ce4167de1adcf59e145954474b1ead85fb9c6d32604b3d60b042fb8f24a5",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/3f5a8c6ee6ceea308d07def0f8430045f2edbc8e.zip"],  # 2019-10-07T19:16:08Z
      strip_prefix = "googletest-3f5a8c6ee6ceea308d07def0f8430045f2edbc8e",
      sha256 = "86d33f93c2250838ecd131adbe0b54599e06759722085a339f5dbebd27bfb732",
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
