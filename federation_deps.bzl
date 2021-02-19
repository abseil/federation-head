"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2021-02-05T12:30:09Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/40548a2974f1aea06215272d9c2b47a14a24e556.zip",
           "https://github.com/bazelbuild/rules_cc/archive/40548a2974f1aea06215272d9c2b47a14a24e556.zip"
      ],
      strip_prefix = "rules_cc-40548a2974f1aea06215272d9c2b47a14a24e556",
      sha256 = "56ac9633c13d74cb71e0546f103ce1c58810e4a76aa8325da593ca4277908d72",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2021-02-16T18:15:13Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/6135186f93d46ab8551d9fe52bac97bf0c2de1ab.zip",
           "https://github.com/bazelbuild/rules_python/archive/6135186f93d46ab8551d9fe52bac97bf0c2de1ab.zip"
      ],
      strip_prefix = "rules_python-6135186f93d46ab8551d9fe52bac97bf0c2de1ab",
      sha256 = "a83c49226394d80442bf1e872ed02b1a5633969b5ec7f7f5644b2852019e76d7",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-02-19T01:12:44Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/b5173c8d45bbb1eae9900eea6231823041cac64f.zip",
           "https://github.com/abseil/abseil-cpp/archive/b5173c8d45bbb1eae9900eea6231823041cac64f.zip"
      ],
      strip_prefix = "abseil-cpp-b5173c8d45bbb1eae9900eea6231823041cac64f",
      sha256 = "ee3b874d2a1884092374a60062e568c0fb2140067c151ec9ee8c62bdb88596a9",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-02-18T18:27:15Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/daa0df7b410cfed62ef474446eff22148a272a8d.zip",
           "https://github.com/google/googletest/archive/daa0df7b410cfed62ef474446eff22148a272a8d.zip"
      ],
      strip_prefix = "googletest-daa0df7b410cfed62ef474446eff22148a272a8d",
      sha256 = "3f666243aaa82bfbdfd26bea72850360186dc47083ad53417705a25663eeb6de",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-02-14T14:45:57Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/d90321ff7ab553f97449b7017caf29ec18e74c6b.zip",
           "https://github.com/google/benchmark/archive/d90321ff7ab553f97449b7017caf29ec18e74c6b.zip"
      ],
      strip_prefix = "benchmark-d90321ff7ab553f97449b7017caf29ec18e74c6b",
      sha256 = "1f8541ff4f92344ec34384f8ae963b47e4d115cd6b07a25962c65b4bd1fd73e7",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-02-17T16:16:51Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/5466ad11bba3c79f0d7690db8e5c5be23867b402.zip",
           "https://github.com/google/tcmalloc/archive/5466ad11bba3c79f0d7690db8e5c5be23867b402.zip"
      ],
      strip_prefix = "tcmalloc-5466ad11bba3c79f0d7690db8e5c5be23867b402",
      sha256 = "ff7429539ac0d927335596c93522f4527b55ed3289dadd01954e16ec6a4d7e26",
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
