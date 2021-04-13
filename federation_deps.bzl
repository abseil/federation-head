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
      name = "rules_python",  # 2021-04-12T00:34:56Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da.zip",
           "https://github.com/bazelbuild/rules_python/archive/5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da.zip"
      ],
      strip_prefix = "rules_python-5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da",
      sha256 = "20b13c6fef2aa18c181e5aa4b8efae891e0fa3aa6e334cc6f5feb264612c8da5",
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
      name = "com_google_googletest",  # 2021-04-13T03:14:27Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/486a4a6be5565e89ae0d72f532c441423110bc9e.zip",
           "https://github.com/google/googletest/archive/486a4a6be5565e89ae0d72f532c441423110bc9e.zip"
      ],
      strip_prefix = "googletest-486a4a6be5565e89ae0d72f532c441423110bc9e",
      sha256 = "f44d8f9456e01fcaacc1930d37a3d8c74c295d603658db9abd797235bb648266",
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
      name = "com_github_google_tcmalloc",  # 2021-04-13T02:51:17Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/f096dd024e83d1eb0f67bdd9d71fa6a3cddaeb6f.zip",
           "https://github.com/google/tcmalloc/archive/f096dd024e83d1eb0f67bdd9d71fa6a3cddaeb6f.zip"
      ],
      strip_prefix = "tcmalloc-f096dd024e83d1eb0f67bdd9d71fa6a3cddaeb6f",
      sha256 = "54c7aa69b23560f61116fc90343070e4bc01b28d66a29d214e2342a2889a8e3b",
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
