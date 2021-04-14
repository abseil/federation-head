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
      name = "com_google_absl",  # 2021-04-14T02:59:46Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/db1b7310d7021700b5a7bcea1989b2a625529f40.zip",
           "https://github.com/abseil/abseil-cpp/archive/db1b7310d7021700b5a7bcea1989b2a625529f40.zip"
      ],
      strip_prefix = "abseil-cpp-db1b7310d7021700b5a7bcea1989b2a625529f40",
      sha256 = "025bc741c1468bbd38885cc979853f81a5e60c9e7b72a75a20e3b588ad40eae3",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-14T00:58:07Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/4400d68de42a77d9709221cb8f179f40c0a21732.zip",
           "https://github.com/google/googletest/archive/4400d68de42a77d9709221cb8f179f40c0a21732.zip"
      ],
      strip_prefix = "googletest-4400d68de42a77d9709221cb8f179f40c0a21732",
      sha256 = "2e51918ba711aa489a2f9b5778108875437bac5960f37b5d56e1ca0d09d725eb",
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
