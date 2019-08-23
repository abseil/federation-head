"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    http_archive(
        name = "rules_cc",
        strip_prefix = "rules_cc-master",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/master.zip"],
    )

    http_archive(
        name = "rules_python",
        strip_prefix = "rules_python-master",
        urls = ["https://github.com/bazelbuild/rules_python/archive/master.zip"],
    )

# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/262d74ba81b1fc4d71f459555cde8ecb39786d68.zip"],  # 2019-08-21T20:54:41Z
      strip_prefix = "abseil-cpp-262d74ba81b1fc4d71f459555cde8ecb39786d68",
      sha256 = "f29dd8e0eb616635f5ddfed28da16c2594776070e3d11ac7c0cdf1cbfa130666",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/fb49e6c164490a227bbb7cf5223b846c836a0305.zip"],  # 2019-08-21T21:13:34Z
      strip_prefix = "googletest-fb49e6c164490a227bbb7cf5223b846c836a0305",
      sha256 = "b97785dc9ff7a4b1fa308e8a685b16da8ca368d422d869b6190237b313bca04e",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/7ee72863fdb1ccb2af5a011250b56af3f49b7511.zip"],  # 2019-08-21T21:12:03Z
      strip_prefix = "benchmark-7ee72863fdb1ccb2af5a011250b56af3f49b7511",
      sha256 = "85bf03b34280462cff7afb410357b8e97e1a65154dd4e0ee19fa600aa38cf2c0",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
