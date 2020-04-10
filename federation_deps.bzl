"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    # ********** rules_cc *****************
    http_archive(
      name = "rules_cc",  # 2020-04-09T08:35:48Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_cc/archive/7c3170fe93e13fbd4835bfa4f64ff93cf2c9b6c8.zip",
           "https://github.com/bazelbuild/rules_cc/archive/7c3170fe93e13fbd4835bfa4f64ff93cf2c9b6c8.zip"
      ],
      strip_prefix = "rules_cc-7c3170fe93e13fbd4835bfa4f64ff93cf2c9b6c8",
      sha256 = "be2d42661f6bb0bd5955ae87e85cda6ab7a9614ac8080a7ff731fba559d859d1",
    )

    # ********** rules_python *****************
    http_archive(
      name = "rules_python",  # 2020-04-09T15:00:47Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/bazelbuild/rules_python/archive/a0fbf98d4e3a232144df4d0d80b577c7a693b570.zip",
           "https://github.com/bazelbuild/rules_python/archive/a0fbf98d4e3a232144df4d0d80b577c7a693b570.zip"
      ],
      strip_prefix = "rules_python-a0fbf98d4e3a232144df4d0d80b577c7a693b570",
      sha256 = "98c9b903f6e8fe20b7e56d19c4822c8c49a11b475bd4ec0ca6a564e8bc5d5fa2",
    )

    # ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",  # 2020-04-08T01:50:15Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/abseil/abseil-cpp/archive/1112609635037a32435de7aa70a9188dcb591458.zip",
           "https://github.com/abseil/abseil-cpp/archive/1112609635037a32435de7aa70a9188dcb591458.zip"
      ],
      strip_prefix = "abseil-cpp-1112609635037a32435de7aa70a9188dcb591458",
      sha256 = "2ad95ee8fe9ee5aef55d8a9b59dfbd9c66056364a98dc3076ff3b32698b7bbe8",
    )

    # ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",  # 2020-04-04T22:05:39Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/googletest/archive/e3f0319d89f4cbf32993de595d984183b1a9fc57.zip",
           "https://github.com/google/googletest/archive/e3f0319d89f4cbf32993de595d984183b1a9fc57.zip"
      ],
      strip_prefix = "googletest-e3f0319d89f4cbf32993de595d984183b1a9fc57",
      sha256 = "363089f62b375e6a73b7149015e7fe92e50d124ab4e95ba062774c496d96f2fc",
    )

    # ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",  # 2020-04-06T12:52:09Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/benchmark/archive/0ab2c2906b95f41dfa7b692ca4ab856e20ebd3d4.zip",
           "https://github.com/google/benchmark/archive/0ab2c2906b95f41dfa7b692ca4ab856e20ebd3d4.zip"
      ],
      strip_prefix = "benchmark-0ab2c2906b95f41dfa7b692ca4ab856e20ebd3d4",
      sha256 = "f957d87a99b9ef4695699e6c934d02ce16a36830712805325bbe76a6cf9927e6",
    )

    # ********** com_github_google_tcmalloc *****************
    http_archive(
      name = "com_github_google_tcmalloc",  # 2020-04-10T00:02:43Z
      urls = [
           # Use the same URL twice to trick bazel into re-trying if connection fails
           "https://github.com/google/tcmalloc/archive/f24457160a7a0b90f9e59815b9752c4c56e21bb5.zip",
           "https://github.com/google/tcmalloc/archive/f24457160a7a0b90f9e59815b9752c4c56e21bb5.zip"
      ],
      strip_prefix = "tcmalloc-f24457160a7a0b90f9e59815b9752c4c56e21bb5",
      sha256 = "2643469a2d9500378f4c9befa33d820d8df2ecd62e39dc2823c4afc4c6f33c9a",
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
