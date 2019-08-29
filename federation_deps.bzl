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
      urls = ["https://github.com/abseil/abseil-cpp/archive/0e7afdcbd24c7e5b7cab4e0217d8886f1525b520.zip"],  # 2019-08-19T19:34:07Z
      strip_prefix = "abseil-cpp-0e7afdcbd24c7e5b7cab4e0217d8886f1525b520",
      sha256 = "5dcf7aa1611d4627c06a53caf997fa5d32f69e81ede3a98199d56da4dd0d18b2",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/c9ccac7cb7345901884aabf5d1a786cfa6e2f397.zip"],  # 2019-08-19T20:17:03Z
      strip_prefix = "googletest-c9ccac7cb7345901884aabf5d1a786cfa6e2f397",
      sha256 = "8bb781f17c7a463bba95f95b29a4df4645b053e3a8d95ebcc017800664834cbb",
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
