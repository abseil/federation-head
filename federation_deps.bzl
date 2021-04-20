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
      name = "rules_python",  # 2021-04-18T23:34:25Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/04c6d7fb1361e2242f1c2b0869b3c80ae870be1d.zip",
           "https://github.com/bazelbuild/rules_python/archive/04c6d7fb1361e2242f1c2b0869b3c80ae870be1d.zip"
      ],
      strip_prefix = "rules_python-04c6d7fb1361e2242f1c2b0869b3c80ae870be1d",
      sha256 = "bcf8f7736068e5d8ba720544762ecfb45992fb129264ff4f99fee7bf3f52b7b9",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-16T22:13:33Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/732c6540c19610d2653ce73c09eb6cb66da15f42.zip",
           "https://github.com/abseil/abseil-cpp/archive/732c6540c19610d2653ce73c09eb6cb66da15f42.zip"
      ],
      strip_prefix = "abseil-cpp-732c6540c19610d2653ce73c09eb6cb66da15f42",
      sha256 = "f8db92e5d3b9a880797b5f04839b36e1880253a97fd590db534f2efa5560fe43",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-17T00:33:13Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/eaf9a3fd77869cf95befb87455a2e2a2e85044ff.zip",
           "https://github.com/google/googletest/archive/eaf9a3fd77869cf95befb87455a2e2a2e85044ff.zip"
      ],
      strip_prefix = "googletest-eaf9a3fd77869cf95befb87455a2e2a2e85044ff",
      sha256 = "03930e55830249eb0bf58c52bcacc7fbe309d9208f1048bb3e93466582cd7b0f",
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
      name = "com_github_google_tcmalloc",  # 2021-04-19T22:19:23Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/2602c75c068f6d0dbbf1b0a43bf2ab72ce264942.zip",
           "https://github.com/google/tcmalloc/archive/2602c75c068f6d0dbbf1b0a43bf2ab72ce264942.zip"
      ],
      strip_prefix = "tcmalloc-2602c75c068f6d0dbbf1b0a43bf2ab72ce264942",
      sha256 = "782744e726e4e41b252f2b68f05db53258583cddc365698c4970ba14cf518b0b",
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
