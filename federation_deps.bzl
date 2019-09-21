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
      urls = ["https://github.com/abseil/abseil-cpp/archive/ddf8e52a2918dd0ccec75d3e2426125fa3926724.zip"],  # 2019-09-19T21:08:45Z
      strip_prefix = "abseil-cpp-ddf8e52a2918dd0ccec75d3e2426125fa3926724",
      sha256 = "ffd661b33a50839d097c833f0f485abd9f562c1da05798fd1cce81482b1ce6e1",
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
      urls = ["https://github.com/google/benchmark/archive/d2fc7fe6591393c2672f3ba011304b778e71c020.zip"],  # 2019-09-20T09:25:31Z
      strip_prefix = "benchmark-d2fc7fe6591393c2672f3ba011304b778e71c020",
      sha256 = "2ada41c1e6a364413b156569d2d7253dfbc0788bdea54beadc2e8a1ce81e19e0",
)

    # zlib pinned to 1.2.11
    http_archive(
      name = "net_zlib",
      build_file = "@com_google_absl_oss_federation//:zlib.BUILD",
      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
      strip_prefix = "zlib-1.2.11",
      urls = ["https://zlib.net/zlib-1.2.11.tar.gz"],
    )
