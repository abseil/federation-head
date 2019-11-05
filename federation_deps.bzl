"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    http_archive(
        name = "rules_cc",
        strip_prefix = "rules_cc-master",
      # Use the same URL twice to trick bazel into re-trying if connection fails
      urls = [
          "https://github.com/bazelbuild/rules_cc/archive/master.zip",
          "https://github.com/bazelbuild/rules_cc/archive/master.zip"
      ],
    )

    http_archive(
        name = "rules_python",
        strip_prefix = "rules_python-master",
      # Use the same URL twice to trick bazel into re-trying if connection fails
      urls = [
          "https://github.com/bazelbuild/rules_python/archive/master.zip",
          "https://github.com/bazelbuild/rules_python/archive/master.zip"
      ],
    )

# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/20de2db748ca0471cfb61cb53e813dd12938c12b.zip","https://github.com/abseil/abseil-cpp/archive/20de2db748ca0471cfb61cb53e813dd12938c12b.zip"],  # 2019-11-04T15:54:44Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "abseil-cpp-20de2db748ca0471cfb61cb53e813dd12938c12b",
      sha256 = "33288294d495744c6cd36799eaa02c8dfde98f15884ab7f06181e4468bd86edc",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/8697709e0308af4cd5b09dc108480804e5447cf0.zip","https://github.com/google/googletest/archive/8697709e0308af4cd5b09dc108480804e5447cf0.zip"],  # 2019-11-04T16:43:27Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "googletest-8697709e0308af4cd5b09dc108480804e5447cf0",
      sha256 = "01d49759ad788c32cac00e82a9ef76ffbd247b81f956cd2be2a6580385441298",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/c50ac68c50ff8da3827cd6720792117910d85666.zip","https://github.com/google/benchmark/archive/c50ac68c50ff8da3827cd6720792117910d85666.zip"],  # 2019-11-05T19:46:13Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "benchmark-c50ac68c50ff8da3827cd6720792117910d85666",
      sha256 = "9067442aa447e54cc144160420daf37fcd0663ccf3057ce2d87b9d7f6ad45d3f",
)

    # zlib pinned to 1.2.11
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
