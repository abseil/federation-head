"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
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

# ********** rules_cc *****************
    http_archive(
      name = "rules_cc",
      urls = ["https://github.com/bazelbuild/rules_cc/archive/624b5d59dfb45672d4239422fa1e3de1822ee110.zip"],  # 2019-08-12T18:23:38Z
      strip_prefix = "rules_cc-624b5d59dfb45672d4239422fa1e3de1822ee110",
      sha256 = "8c7e8bf24a2bf515713445199a677ee2336e1c487fa1da41037c6026de04bbc3",
)

# ********** rules_python *****************
    http_archive(
      name = "rules_python",
      urls = ["https://github.com/bazelbuild/rules_python/archive/9d68f24659e8ce8b736590ba1e4418af06ec2552.zip"],  # 2019-08-14T16:54:25Z
      strip_prefix = "rules_python-9d68f24659e8ce8b736590ba1e4418af06ec2552",
      sha256 = "f7402f11691d657161f871e11968a984e5b48b023321935f5a55d7e56cf4758a",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
