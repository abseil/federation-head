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
      name = "com_google_absl",  # 2021-04-28T19:09:58Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/f14d5f4af12eb521a5142151d6ea3addbbed42bb.zip",
           "https://github.com/abseil/abseil-cpp/archive/f14d5f4af12eb521a5142151d6ea3addbbed42bb.zip"
      ],
      strip_prefix = "abseil-cpp-f14d5f4af12eb521a5142151d6ea3addbbed42bb",
      sha256 = "de1e08506abb3811c3a59271e288892a3a564aa86737c7cdcfc96e9c67edec9a",
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
      name = "com_github_google_benchmark",  # 2021-04-28T15:44:33Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/64cb55e91067860548cb95e012a38f2e5b71e026.zip",
           "https://github.com/google/benchmark/archive/64cb55e91067860548cb95e012a38f2e5b71e026.zip"
      ],
      strip_prefix = "benchmark-64cb55e91067860548cb95e012a38f2e5b71e026",
      sha256 = "993a88944d055c7d3c4f684ebbf0f08599c6e8192a374974a71933493c651729",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-23T17:48:02Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/5200f10aa521542acf6dba8f184522805d4191d3.zip",
           "https://github.com/google/tcmalloc/archive/5200f10aa521542acf6dba8f184522805d4191d3.zip"
      ],
      strip_prefix = "tcmalloc-5200f10aa521542acf6dba8f184522805d4191d3",
      sha256 = "4a901b04fa34365198211e9bd7070909beb02d395bf09a78742db6aa692c1823",
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
