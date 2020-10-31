"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2020-10-30T20:05:57Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/699ec5298546a0285a57f77dc47d72363c4d2517.zip",
           "https://github.com/bazelbuild/rules_cc/archive/699ec5298546a0285a57f77dc47d72363c4d2517.zip"
      ],
      strip_prefix = "rules_cc-699ec5298546a0285a57f77dc47d72363c4d2517",
      sha256 = "39b49471460a4c886354e74f4fa302c7edf66fc0a6862988d91c7dc4279fb67f",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2020-10-26T14:11:16Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/5be1f76e3ecd1f743f4213f3087c2a0961411782.zip",
           "https://github.com/bazelbuild/rules_python/archive/5be1f76e3ecd1f743f4213f3087c2a0961411782.zip"
      ],
      strip_prefix = "rules_python-5be1f76e3ecd1f743f4213f3087c2a0961411782",
      sha256 = "d10f790e7251a42c6d2b673c0449223b45e2a468d6a06c5bb4fa986cfc2c76d2",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2020-10-30T19:43:07Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/c9894d1dc38577c4ce50eefe0a944ea8d46d7fc5.zip",
           "https://github.com/abseil/abseil-cpp/archive/c9894d1dc38577c4ce50eefe0a944ea8d46d7fc5.zip"
      ],
      strip_prefix = "abseil-cpp-c9894d1dc38577c4ce50eefe0a944ea8d46d7fc5",
      sha256 = "3e987c9da30126a62749bcadb4d7d76332d85da0666114792bc2de3e6bb059c9",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2020-10-30T18:10:41Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/2828773179fa425ee406df61890a150577178ea2.zip",
           "https://github.com/google/googletest/archive/2828773179fa425ee406df61890a150577178ea2.zip"
      ],
      strip_prefix = "googletest-2828773179fa425ee406df61890a150577178ea2",
      sha256 = "8241d0d0696ef49534cfae820fdc4e042f96024119c58c987613807a0742dc79",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2020-10-29T08:49:02Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/a9704c268dd2ed8bc65d8fc2880cb7a0ddd64d2c.zip",
           "https://github.com/google/benchmark/archive/a9704c268dd2ed8bc65d8fc2880cb7a0ddd64d2c.zip"
      ],
      strip_prefix = "benchmark-a9704c268dd2ed8bc65d8fc2880cb7a0ddd64d2c",
      sha256 = "2ad78d4d639f36b4bf36c5e4c64d36630ea2e1d2189fcacf89910539c9ac336f",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2020-10-30T22:11:48Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/a0fa83bbc947107902fa6e96a74d93458ed7abdd.zip",
           "https://github.com/google/tcmalloc/archive/a0fa83bbc947107902fa6e96a74d93458ed7abdd.zip"
      ],
      strip_prefix = "tcmalloc-a0fa83bbc947107902fa6e96a74d93458ed7abdd",
      sha256 = "42deb554326f835a857c3ec27f29de3fb278a398e18eef7aea0eae486be3f7c5",
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
