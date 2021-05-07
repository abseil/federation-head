"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2021-05-06T15:44:55Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/56897752c092569bba02da18b945033bcb42f2ad.zip",
           "https://github.com/bazelbuild/rules_cc/archive/56897752c092569bba02da18b945033bcb42f2ad.zip"
      ],
      strip_prefix = "rules_cc-56897752c092569bba02da18b945033bcb42f2ad",
      sha256 = "108d8900b87dbb3d00d27b1ee5487a7d7276d8e8bd85c5681d4ccab474319391",
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
      name = "com_google_absl",  # 2021-05-06T15:11:13Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/70b29fe5a5c1752158830eabc9aa273718b477af.zip",
           "https://github.com/abseil/abseil-cpp/archive/70b29fe5a5c1752158830eabc9aa273718b477af.zip"
      ],
      strip_prefix = "abseil-cpp-70b29fe5a5c1752158830eabc9aa273718b477af",
      sha256 = "c690d0f102c3d1a326ac59a7ebb3d21750dfad9c235c557dc44883ecba1665b0",
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
      name = "com_github_google_benchmark",  # 2021-05-06T19:31:14Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/a2e8a8a9db0d842929514377759ae83da8a76da6.zip",
           "https://github.com/google/benchmark/archive/a2e8a8a9db0d842929514377759ae83da8a76da6.zip"
      ],
      strip_prefix = "benchmark-a2e8a8a9db0d842929514377759ae83da8a76da6",
      sha256 = "17f55e188b2f4ad2ce8dc15df0faee1c85911259ae87ade1efd295e54c26550e",
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
