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
      name = "com_google_absl",  # 2021-05-05T15:06:54Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/037ade20d1132781aae3cda4d547a9e6a5f557bf.zip",
           "https://github.com/abseil/abseil-cpp/archive/037ade20d1132781aae3cda4d547a9e6a5f557bf.zip"
      ],
      strip_prefix = "abseil-cpp-037ade20d1132781aae3cda4d547a9e6a5f557bf",
      sha256 = "afb49c1d5bcf826c0093e8910ec76699d4d1bd9e92c4f8f7f24a48fcf6d562a6",
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
      name = "com_github_google_benchmark",  # 2021-05-05T11:08:23Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/d0c227ccfd87de776f0a6e097b0d6039315608a2.zip",
           "https://github.com/google/benchmark/archive/d0c227ccfd87de776f0a6e097b0d6039315608a2.zip"
      ],
      strip_prefix = "benchmark-d0c227ccfd87de776f0a6e097b0d6039315608a2",
      sha256 = "90cca93346b8cfd253d54b4da37d535976d1ac4bb53cbf2f754c0c8b81b0b8cf",
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
