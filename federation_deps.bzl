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
      name = "rules_python",  # 2021-04-14T04:24:48Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/0ab06a2d6cc5abca83d9c8a21d65630b773a079b.zip",
           "https://github.com/bazelbuild/rules_python/archive/0ab06a2d6cc5abca83d9c8a21d65630b773a079b.zip"
      ],
      strip_prefix = "rules_python-0ab06a2d6cc5abca83d9c8a21d65630b773a079b",
      sha256 = "917a154c3890c1e8f21c070280926454637cd290162f4ee6174877ce3566cc8b",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-14T23:12:56Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/46dfbfe31ca1dd414e4c33cbcbcd7199bb4efde3.zip",
           "https://github.com/abseil/abseil-cpp/archive/46dfbfe31ca1dd414e4c33cbcbcd7199bb4efde3.zip"
      ],
      strip_prefix = "abseil-cpp-46dfbfe31ca1dd414e4c33cbcbcd7199bb4efde3",
      sha256 = "718959c96ef7f46549d719e8f17161046fdebcde979cd783a7581fc7fe578091",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-14T20:51:13Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/8d664b94bebc86a9d3c6272bb41039310c550e58.zip",
           "https://github.com/google/googletest/archive/8d664b94bebc86a9d3c6272bb41039310c550e58.zip"
      ],
      strip_prefix = "googletest-8d664b94bebc86a9d3c6272bb41039310c550e58",
      sha256 = "c53f30b11bdcb382374cf9a5c6f7f7b2ecc076802e864c9626ff64c4c58ac314",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-04-12T11:46:05Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/39b5a298a7a502f9b8620127030ba318babdcb53.zip",
           "https://github.com/google/benchmark/archive/39b5a298a7a502f9b8620127030ba318babdcb53.zip"
      ],
      strip_prefix = "benchmark-39b5a298a7a502f9b8620127030ba318babdcb53",
      sha256 = "b717f6693cafc5335b74e46ac6d6b2f0d5f6c3ff59715929eccd12afccd68925",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-14T23:38:52Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/1fd7391763f7a6a2123f407cac68758c87918e82.zip",
           "https://github.com/google/tcmalloc/archive/1fd7391763f7a6a2123f407cac68758c87918e82.zip"
      ],
      strip_prefix = "tcmalloc-1fd7391763f7a6a2123f407cac68758c87918e82",
      sha256 = "1f52e0a2655b7c3604986591d112a25980eb9e1006cfc0dc0cf32d805c4d3ce0",
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
