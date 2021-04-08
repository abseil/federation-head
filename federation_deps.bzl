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
      name = "rules_python",  # 2021-04-07T13:45:21Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/bc256eff477eb08045f13bea58213672efb25d4e.zip",
           "https://github.com/bazelbuild/rules_python/archive/bc256eff477eb08045f13bea58213672efb25d4e.zip"
      ],
      strip_prefix = "rules_python-bc256eff477eb08045f13bea58213672efb25d4e",
      sha256 = "8c1e24d8ff6a495aa06396617afc80f3f0a6554c5f74ae63f5b5d6b683be9eb9",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-07T14:26:32Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/3b4a16abad2c2ddc494371cc39a2946e36d35d11.zip",
           "https://github.com/abseil/abseil-cpp/archive/3b4a16abad2c2ddc494371cc39a2946e36d35d11.zip"
      ],
      strip_prefix = "abseil-cpp-3b4a16abad2c2ddc494371cc39a2946e36d35d11",
      sha256 = "64c43686598cf554d9e91fa9a6dafd87a84d7ce9f667dccdd3971b5b249960dc",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-08T06:39:39Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/6a5eb807493214be733d4cbb9f07f22fde25284f.zip",
           "https://github.com/google/googletest/archive/6a5eb807493214be733d4cbb9f07f22fde25284f.zip"
      ],
      strip_prefix = "googletest-6a5eb807493214be733d4cbb9f07f22fde25284f",
      sha256 = "1315261a037d90405714830edf4243fccd89950556353aa3d21095b6a1430ead",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-03-30T13:43:03Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/5e387e7d33a55b8d6b7c5025379b97cc9418fabf.zip",
           "https://github.com/google/benchmark/archive/5e387e7d33a55b8d6b7c5025379b97cc9418fabf.zip"
      ],
      strip_prefix = "benchmark-5e387e7d33a55b8d6b7c5025379b97cc9418fabf",
      sha256 = "d37d3fb186bbcc30018962185606869c032e866bc9ad376a6112fbb64fe6935f",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-06T00:13:49Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/1ad2eac46ef7fcb511f29d7ddd0c2107925b1d33.zip",
           "https://github.com/google/tcmalloc/archive/1ad2eac46ef7fcb511f29d7ddd0c2107925b1d33.zip"
      ],
      strip_prefix = "tcmalloc-1ad2eac46ef7fcb511f29d7ddd0c2107925b1d33",
      sha256 = "de7164a9b005767e202a2af30ad8d5f56945dfc72e195869a474eca26e1ac644",
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
