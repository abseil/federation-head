"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/9a41ffdd3a0ccbcdd29c4e3886b28e06f2cd9c66.zip"],  # 2019-08-16T14:44:01Z
      strip_prefix = "abseil-cpp-9a41ffdd3a0ccbcdd29c4e3886b28e06f2cd9c66",
      sha256 = "e465e100113e67e309237e5d952c773f4b1d4fcde51a45ba0ebb7cc0ac253741",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/27e17f7851e2cc51db2c47470d29513970327cc1.zip"],  # 2019-08-16T16:50:16Z
      strip_prefix = "googletest-27e17f7851e2cc51db2c47470d29513970327cc1",
      sha256 = "c84f86dc982a7f0429ac986ca11d8c70e99f8b5300e26246c19162611418b343",
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
