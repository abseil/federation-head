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
      urls = ["https://github.com/google/googletest/archive/f2fb48c3b3d79a75a88a99fba6576b25d42ec528.zip"],  # 2019-09-16T15:47:35Z
      strip_prefix = "googletest-f2fb48c3b3d79a75a88a99fba6576b25d42ec528",
      sha256 = "89e98c265b80181d902b1a19c10c29b3a22d804b207214d8104ad42905fbae87",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/bf4f2ea0bd1180b34718ac26eb79b170a4f6290e.zip"],  # 2019-09-16T08:05:05Z
      strip_prefix = "benchmark-bf4f2ea0bd1180b34718ac26eb79b170a4f6290e",
      sha256 = "e474a7f0112b9f2cd7e26ccd03c39d1c68114d3cad8f292021143b548fb00db7",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
