"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/321ab5303023c86cd15d9ddc5740fb4b4fde32e1.zip"],  # 2019-08-12T16:14:06Z
      strip_prefix = "abseil-cpp-321ab5303023c86cd15d9ddc5740fb4b4fde32e1",
      sha256 = "a70a7e8ee96e0c69a049e2463474e69ebedd0cd97e7308f7907103d9add40179",
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
      urls = ["https://github.com/google/benchmark/archive/7d97a057e16597e8020d0aca110480fe82c9ca67.zip"],  # 2019-08-12T14:47:46Z
      strip_prefix = "benchmark-7d97a057e16597e8020d0aca110480fe82c9ca67",
      sha256 = "8418a37ff725e0e9730442e04b6cb60e8374e0213bc518ed1ad599846f3b35eb",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
