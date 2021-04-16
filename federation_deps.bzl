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
      name = "rules_python",  # 2021-04-15T19:11:12Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/37f04a42fbce5eeb23cfc515cedb90b3f108a6cd.zip",
           "https://github.com/bazelbuild/rules_python/archive/37f04a42fbce5eeb23cfc515cedb90b3f108a6cd.zip"
      ],
      strip_prefix = "rules_python-37f04a42fbce5eeb23cfc515cedb90b3f108a6cd",
      sha256 = "1a5c3001e10cabfe475cd2a6f84e390d6a36797df001dc68091bdd5b18d4f5a7",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2021-04-16T02:45:30Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/e20fe888fabc1fc995dc61180e8a31b5f809a95f.zip",
           "https://github.com/abseil/abseil-cpp/archive/e20fe888fabc1fc995dc61180e8a31b5f809a95f.zip"
      ],
      strip_prefix = "abseil-cpp-e20fe888fabc1fc995dc61180e8a31b5f809a95f",
      sha256 = "ff89425afc78c1e7911606a133304a02a58ae17a17d7d261cf703bd0fc8ce593",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2021-04-16T03:41:37Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/831bc03504b0946929bb05dcb323e3b2dc3d2bd5.zip",
           "https://github.com/google/googletest/archive/831bc03504b0946929bb05dcb323e3b2dc3d2bd5.zip"
      ],
      strip_prefix = "googletest-831bc03504b0946929bb05dcb323e3b2dc3d2bd5",
      sha256 = "b4061b3fd0d29ac9c4d0605a25f752b9f73c4660314218277653ac9c928cec5a",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2021-04-12T11:46:05Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/39b5a298a7a502f9b8620127030ba318babdcb53.zip",
           "https://github.com/google/benchmark/archive/39b5a298a7a502f9b8620127030ba318babdcb53.zip"
      ],
      strip_prefix = "benchmark-39b5a298a7a502f9b8620127030ba318babdcb53",
      sha256 = "b717f6693cafc5335b74e46ac6d6b2f0d5f6c3ff59715929eccd12afccd68925",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2021-04-15T18:19:54Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/97d9df599afb65a273b0d3a0d19f62e44f720100.zip",
           "https://github.com/google/tcmalloc/archive/97d9df599afb65a273b0d3a0d19f62e44f720100.zip"
      ],
      strip_prefix = "tcmalloc-97d9df599afb65a273b0d3a0d19f62e44f720100",
      sha256 = "c3f4118e88a64a21912a0ba88c0de28a055f0b636acbabf8019bb0f71ea4ae4b",
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
