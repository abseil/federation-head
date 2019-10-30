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
      urls = ["https://github.com/abseil/abseil-cpp/archive/83880e3d8ce512461c290782b541a623e50e39ef.zip","https://github.com/abseil/abseil-cpp/archive/83880e3d8ce512461c290782b541a623e50e39ef.zip"],  # 2019-10-30T19:04:55Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "abseil-cpp-83880e3d8ce512461c290782b541a623e50e39ef",
      sha256 = "27eb7401e2310d5279a52ce1fbeb695c1dc2dcc6b999d1e730e11b98cac5e0f5",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/0a03480824b4fc7883255dbd2fd8940c9f81e22e.zip","https://github.com/google/googletest/archive/0a03480824b4fc7883255dbd2fd8940c9f81e22e.zip"],  # 2019-10-30T20:49:09Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "googletest-0a03480824b4fc7883255dbd2fd8940c9f81e22e",
      sha256 = "f95f14a6c7c9baf3c62414f4cdeb681ed1c3935c986b103148967b646ea21e30",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/cf446a18bf37d5cc9b116f59cf9e6a9be89e58cc.zip","https://github.com/google/benchmark/archive/cf446a18bf37d5cc9b116f59cf9e6a9be89e58cc.zip"],  # 2019-10-24T19:13:03Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "benchmark-cf446a18bf37d5cc9b116f59cf9e6a9be89e58cc",
      sha256 = "ff01751c5dfe310b4f6f77a7ea689fd918b7bd4ac0020ca88e4ce7084657d6a4",
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
