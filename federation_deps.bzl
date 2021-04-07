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
      name = "rules_python",  # 2021-04-01T19:21:20Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/5126cf1bd3d423bbb6aebe14e44546ca2585ea44.zip",
           "https://github.com/bazelbuild/rules_python/archive/5126cf1bd3d423bbb6aebe14e44546ca2585ea44.zip"
      ],
      strip_prefix = "rules_python-5126cf1bd3d423bbb6aebe14e44546ca2585ea44",
      sha256 = "804179a8dced7cb8f14218d6810990391d4d82bb1e1c636a579bbc45ee0e7694",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-05T17:33:42Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/7f4d0ba0be4c70fd71eb4c08a6422c8c2f7faa0b.zip",
           "https://github.com/abseil/abseil-cpp/archive/7f4d0ba0be4c70fd71eb4c08a6422c8c2f7faa0b.zip"
      ],
      strip_prefix = "abseil-cpp-7f4d0ba0be4c70fd71eb4c08a6422c8c2f7faa0b",
      sha256 = "1b16517dc1daacc6011896a04de53d5264da73e646f3ad6f0084d7dc640cf193",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-05T23:13:50Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/5c8ca58edfb304b2dd5e6061f83387470826dd87.zip",
           "https://github.com/google/googletest/archive/5c8ca58edfb304b2dd5e6061f83387470826dd87.zip"
      ],
      strip_prefix = "googletest-5c8ca58edfb304b2dd5e6061f83387470826dd87",
      sha256 = "201ef65029422748988e65716092c0c4be2277a18ce4d0e3cd117bd7f83a0ca4",
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
