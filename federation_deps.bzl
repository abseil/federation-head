"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2020-01-03T15:17:37Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/7e650b11fe6d49f70f2ca7a1c4cb8bcc4a1fe239.zip",
           "https://github.com/bazelbuild/rules_cc/archive/7e650b11fe6d49f70f2ca7a1c4cb8bcc4a1fe239.zip"
      ],
      strip_prefix = "rules_cc-7e650b11fe6d49f70f2ca7a1c4cb8bcc4a1fe239",
      sha256 = "682a0ce1ccdac678d07df56a5f8cf0880fd7d9e08302b8f677b92db22e72052e",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2019-12-05T03:53:08Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/38f86fb55b698c51e8510c807489c9f4e047480e.zip",
           "https://github.com/bazelbuild/rules_python/archive/38f86fb55b698c51e8510c807489c9f4e047480e.zip"
      ],
      strip_prefix = "rules_python-38f86fb55b698c51e8510c807489c9f4e047480e",
      sha256 = "7d64815f4b22400bed0f1b9da663037e1578573446b7bc78f20f24b2b5459bb9",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2020-01-03T18:41:32Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/1de0166368e2ae67347f92099d6dca3ab3a4a496.zip",
           "https://github.com/abseil/abseil-cpp/archive/1de0166368e2ae67347f92099d6dca3ab3a4a496.zip"
      ],
      strip_prefix = "abseil-cpp-1de0166368e2ae67347f92099d6dca3ab3a4a496",
      sha256 = "8f28a1f8c83707db0c2467e8c88b27b18c09f948e6e871fdf444024e32461fb1",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2020-01-02T21:49:38Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/306f3754a71d6d1ac644681d3544d06744914228.zip",
           "https://github.com/google/googletest/archive/306f3754a71d6d1ac644681d3544d06744914228.zip"
      ],
      strip_prefix = "googletest-306f3754a71d6d1ac644681d3544d06744914228",
      sha256 = "1bf944f13ebb58701e3ce99fc13509693aad60384dc2e1fa27f570ecb2412bdc",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2019-12-15T10:38:54Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/0811f1d782455b3c80285bebf934a7045d845ed3.zip",
           "https://github.com/google/benchmark/archive/0811f1d782455b3c80285bebf934a7045d845ed3.zip"
      ],
      strip_prefix = "benchmark-0811f1d782455b3c80285bebf934a7045d845ed3",
      sha256 = "dcba884d08ccfd83d633b50b21aaa9fb87a20241702f4f6ab504a7d9f385570f",
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
