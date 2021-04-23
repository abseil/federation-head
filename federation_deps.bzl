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
      name = "rules_python",  # 2021-04-23T03:38:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/1b4f61b15079d447bb7f8d11894824835e792e6c.zip",
           "https://github.com/bazelbuild/rules_python/archive/1b4f61b15079d447bb7f8d11894824835e792e6c.zip"
      ],
      strip_prefix = "rules_python-1b4f61b15079d447bb7f8d11894824835e792e6c",
      sha256 = "99d974fe9e1d3f421aad9fbee69511f626af0762c2c980cbef34449751f0e8b6",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-20T15:45:46Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/1ae9b71c474628d60eb251a3f62967fe64151bb2.zip",
           "https://github.com/abseil/abseil-cpp/archive/1ae9b71c474628d60eb251a3f62967fe64151bb2.zip"
      ],
      strip_prefix = "abseil-cpp-1ae9b71c474628d60eb251a3f62967fe64151bb2",
      sha256 = "dd6d0efe513a110f3e6a6bba5f2197e6b637287a1c8409a21946818cec85aaaf",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-21T14:24:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/23ef29555ef4789f555f1ba8c51b4c52975f0907.zip",
           "https://github.com/google/googletest/archive/23ef29555ef4789f555f1ba8c51b4c52975f0907.zip"
      ],
      strip_prefix = "googletest-23ef29555ef4789f555f1ba8c51b4c52975f0907",
      sha256 = "065be63080da17335f680bca846e7c298895ca5bb6d241d0ee28ff3c3aa29e7c",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-04-20T06:16:05Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/69054ae50e07e9de7cb27f9e2d1d355f74605524.zip",
           "https://github.com/google/benchmark/archive/69054ae50e07e9de7cb27f9e2d1d355f74605524.zip"
      ],
      strip_prefix = "benchmark-69054ae50e07e9de7cb27f9e2d1d355f74605524",
      sha256 = "ef0fab8058be682e382e155eeda1b22e1747fd6606e22e0c1b19f6da91e8b52d",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-22T20:07:25Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/2a6935dbde8cc348591f843c034f4b42b4dd0e52.zip",
           "https://github.com/google/tcmalloc/archive/2a6935dbde8cc348591f843c034f4b42b4dd0e52.zip"
      ],
      strip_prefix = "tcmalloc-2a6935dbde8cc348591f843c034f4b42b4dd0e52",
      sha256 = "12f16c05a65e89676b710d02fbc07ed4ccc50fb0aad428e18772cd2226c78de2",
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
