"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2021-04-01T09:45:57Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/c612c9581b9e740a49ed4c006edb93912c8ab205.zip",
           "https://github.com/bazelbuild/rules_cc/archive/c612c9581b9e740a49ed4c006edb93912c8ab205.zip"
      ],
      strip_prefix = "rules_cc-c612c9581b9e740a49ed4c006edb93912c8ab205",
      sha256 = "1bef6433ba1a4288b5853dc0ebd6cf436dc1c83cce6e16abf73e7ad1b785def4",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2021-04-12T00:34:56Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da.zip",
           "https://github.com/bazelbuild/rules_python/archive/5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da.zip"
      ],
      strip_prefix = "rules_python-5d6c0a2f154f4ebdc4e9d3fda7e5e33f61bef4da",
      sha256 = "20b13c6fef2aa18c181e5aa4b8efae891e0fa3aa6e334cc6f5feb264612c8da5",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-07T14:26:32Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/3b4a16abad2c2ddc494371cc39a2946e36d35d11.zip",
           "https://github.com/abseil/abseil-cpp/archive/3b4a16abad2c2ddc494371cc39a2946e36d35d11.zip"
      ],
      strip_prefix = "abseil-cpp-3b4a16abad2c2ddc494371cc39a2946e36d35d11",
      sha256 = "64c43686598cf554d9e91fa9a6dafd87a84d7ce9f667dccdd3971b5b249960dc",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-09T16:04:04Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/965f8ecbfd8b91bbd4f5ee4914c028660bb89029.zip",
           "https://github.com/google/googletest/archive/965f8ecbfd8b91bbd4f5ee4914c028660bb89029.zip"
      ],
      strip_prefix = "googletest-965f8ecbfd8b91bbd4f5ee4914c028660bb89029",
      sha256 = "30e15b94865163a5505465634358017dfe23faa93b03fc7002c77c0dd8195f6c",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-04-09T16:32:00Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/07578d82e0a4f99bdd1546f4f6f1727109f9420d.zip",
           "https://github.com/google/benchmark/archive/07578d82e0a4f99bdd1546f4f6f1727109f9420d.zip"
      ],
      strip_prefix = "benchmark-07578d82e0a4f99bdd1546f4f6f1727109f9420d",
      sha256 = "70cc3ee604d401d9d0a04f0e52c062b04b7a787b2213c7380e842edb59c28de8",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-08T18:52:46Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/9b7025fff815998d33c13f65e58a167e7d61d16f.zip",
           "https://github.com/google/tcmalloc/archive/9b7025fff815998d33c13f65e58a167e7d61d16f.zip"
      ],
      strip_prefix = "tcmalloc-9b7025fff815998d33c13f65e58a167e7d61d16f",
      sha256 = "798f8826e243b980cad2211f746044b42556f8a202efd29cb26111defb83c893",
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
