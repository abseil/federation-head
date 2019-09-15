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
      urls = ["https://github.com/abseil/abseil-cpp/archive/ac78ffc3bc0a8b295cab9a03817760fd460df2a1.zip"],  # 2019-09-12T15:57:50Z
      strip_prefix = "abseil-cpp-ac78ffc3bc0a8b295cab9a03817760fd460df2a1",
      sha256 = "27184e97131edb9a289b1c2cd404c234afa5ceaae44c5eb6713138cb674535aa",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/cad3bc46c2ba8ec0bd7bb252d7279fe791140fbf.zip"],  # 2019-09-13T20:09:34Z
      strip_prefix = "googletest-cad3bc46c2ba8ec0bd7bb252d7279fe791140fbf",
      sha256 = "b915b28d5713a9cd3654a36a27d81e723591811eff710794f5f11ee4bb2ac395",
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
