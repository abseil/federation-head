"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/9ee91d3e430fb33a4590486573792eb0fa146c2d.zip"],  # 2019-08-08T18:07:16Z
      strip_prefix = "abseil-cpp-9ee91d3e430fb33a4590486573792eb0fa146c2d",
      sha256 = "5a027970fac1ca24739ad8392d07ba54921f6dfdb619909b593a83a52c0f5afb",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/90a443f9c2437ca8a682a1ac625eba64e1d74a8a.zip"],  # 2019-08-07T15:57:30Z
      strip_prefix = "googletest-90a443f9c2437ca8a682a1ac625eba64e1d74a8a",
      sha256 = "6fb9a49ad77656c860cfdafbb3148a91f076a3a8bda9c6d8809075c832549dd4",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/c408461983dd3adf49d450d7db926fc46f1d99a0.zip"],  # 2019-08-07T19:55:40Z
      strip_prefix = "benchmark-c408461983dd3adf49d450d7db926fc46f1d99a0",
      sha256 = "6d5aad3c2b4c311e79fdff9f1c465732cc50e22a9cc2f8360647ef30b7b1d89a",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
