"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2020-06-03T07:53:38Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/5cbd3dfbd1613f71ef29bbb7b10310b81e272975.zip",
           "https://github.com/bazelbuild/rules_cc/archive/5cbd3dfbd1613f71ef29bbb7b10310b81e272975.zip"
      ],
      strip_prefix = "rules_cc-5cbd3dfbd1613f71ef29bbb7b10310b81e272975",
      sha256 = "d6775fe03da086dfe47c668f54e77e220aa6e601a66a4517eaf19fa1d9fda309",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2020-07-20T01:25:59Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/0f8183b1cfa7e8afebfeeec5bcad75deb846613a.zip",
           "https://github.com/bazelbuild/rules_python/archive/0f8183b1cfa7e8afebfeeec5bcad75deb846613a.zip"
      ],
      strip_prefix = "rules_python-0f8183b1cfa7e8afebfeeec5bcad75deb846613a",
      sha256 = "70efb5f3f0671f76e41887e93793ab849430d8c267cb5ad7eb7b1f6b45e1cad8",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2020-07-27T19:43:11Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/d39fe6cd6f5eb72dc741f17d3a143a6a5a56538a.zip",
           "https://github.com/abseil/abseil-cpp/archive/d39fe6cd6f5eb72dc741f17d3a143a6a5a56538a.zip"
      ],
      strip_prefix = "abseil-cpp-d39fe6cd6f5eb72dc741f17d3a143a6a5a56538a",
      sha256 = "9bdfdcfb6ff4352f129fd26b39628a5107d436ec1b8bf8252658a47f4cb87872",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2020-07-15T18:09:43Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/a781fe29bcf73003559a3583167fe3d647518464.zip",
           "https://github.com/google/googletest/archive/a781fe29bcf73003559a3583167fe3d647518464.zip"
      ],
      strip_prefix = "googletest-a781fe29bcf73003559a3583167fe3d647518464",
      sha256 = "573a79fdf6dd97e8b0dcb52164e3b996f8e46a53fe53b640e81074ca5f5f411b",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2020-07-09T11:54:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/37177a84b7e8d33696ea1e1854513cb0de3b4dc3.zip",
           "https://github.com/google/benchmark/archive/37177a84b7e8d33696ea1e1854513cb0de3b4dc3.zip"
      ],
      strip_prefix = "benchmark-37177a84b7e8d33696ea1e1854513cb0de3b4dc3",
      sha256 = "cd5b852873c0d8fd60aba2bdb3ebc5187b484c18c72dc885d405e33198373bca",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2020-07-24T20:38:03Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/9dfdae4dabe1e6804ee60f519ac953e6836c81cc.zip",
           "https://github.com/google/tcmalloc/archive/9dfdae4dabe1e6804ee60f519ac953e6836c81cc.zip"
      ],
      strip_prefix = "tcmalloc-9dfdae4dabe1e6804ee60f519ac953e6836c81cc",
      sha256 = "f9d6b4b928be200c05bdc1d84a50bfa8db73e5b42823a9e1b3fc2e8407e87d5d",
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
