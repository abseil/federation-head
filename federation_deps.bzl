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
      urls = ["https://github.com/google/googletest/archive/76a560c81cfe75cc6f9ff0c4a37ea3d1ce1229ed.zip"],  # 2019-10-03T17:19:18Z
      strip_prefix = "googletest-76a560c81cfe75cc6f9ff0c4a37ea3d1ce1229ed",
      sha256 = "8bce8d4d6f9786bde777cb1cbd4cd519d8a1d746603e7a80c2014c7fcb8ec0d3",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/f4f5dba46bdbde0e95d736cca124025745bcd7b6.zip"],  # 2019-10-04T08:50:53Z
      strip_prefix = "benchmark-f4f5dba46bdbde0e95d736cca124025745bcd7b6",
      sha256 = "c5deca5b4f8e5871022138362ee020b7d95797889f7491a6c575f646d614a506",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
