"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2021-05-07T09:44:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/656e0451678360df61a0164798df3b5e10ae54e9.zip",
           "https://github.com/bazelbuild/rules_cc/archive/656e0451678360df61a0164798df3b5e10ae54e9.zip"
      ],
      strip_prefix = "rules_cc-656e0451678360df61a0164798df3b5e10ae54e9",
      sha256 = "498aa267611dcc48357f260604c3d0255b50282855871ae42f5a3a8e0063cd51",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2021-05-07T22:02:00Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/1dc8ed9b1944c14893d21afb1dc72b6b723450fa.zip",
           "https://github.com/bazelbuild/rules_python/archive/1dc8ed9b1944c14893d21afb1dc72b6b723450fa.zip"
      ],
      strip_prefix = "rules_python-1dc8ed9b1944c14893d21afb1dc72b6b723450fa",
      sha256 = "1fd90f4a23d8ec0ef41f7b0b8386f73bbd1dd4d83e611803db7e12b89825fbd2",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-05-07T17:51:04Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/079cf662544a14bd1cfaae6d6512645541ba10fb.zip",
           "https://github.com/abseil/abseil-cpp/archive/079cf662544a14bd1cfaae6d6512645541ba10fb.zip"
      ],
      strip_prefix = "abseil-cpp-079cf662544a14bd1cfaae6d6512645541ba10fb",
      sha256 = "97df35e290183ba168ffd44db4567a1a1db4d63b45000bf99df4bb7a6b9822c2",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-29T14:40:44Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/f5e592d8ee5ffb1d9af5be7f715ce3576b8bf9c4.zip",
           "https://github.com/google/googletest/archive/f5e592d8ee5ffb1d9af5be7f715ce3576b8bf9c4.zip"
      ],
      strip_prefix = "googletest-f5e592d8ee5ffb1d9af5be7f715ce3576b8bf9c4",
      sha256 = "e61e3889bd5cc3e6bc1084d2108ecda2f110c0387ba88b394ffd16043a1d5709",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-05-07T13:24:00Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/0852c79f3511dec3115e72d19d99ec8146404cc5.zip",
           "https://github.com/google/benchmark/archive/0852c79f3511dec3115e72d19d99ec8146404cc5.zip"
      ],
      strip_prefix = "benchmark-0852c79f3511dec3115e72d19d99ec8146404cc5",
      sha256 = "22ea477bcd275bd95113153537b462295e8d68ca6622c2a77e6be20356f00a7a",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-05-04T19:06:09Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/c083a79108a4c7235221440b0f401b7d798c3e66.zip",
           "https://github.com/google/tcmalloc/archive/c083a79108a4c7235221440b0f401b7d798c3e66.zip"
      ],
      strip_prefix = "tcmalloc-c083a79108a4c7235221440b0f401b7d798c3e66",
      sha256 = "f3d0fa0bf8bcca7cf69e5b68db9156b48bc2affc8308254fb91d01114941211c",
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
