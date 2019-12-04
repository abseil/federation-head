"""Expose federation components as .bzl file to be loaded """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def federation_deps():
    http_archive(
        name = "rules_cc",
        strip_prefix = "rules_cc-master",
      # Use the same URL twice to trick bazel into re-trying if connection fails
      urls = [
          "https://github.com/bazelbuild/rules_cc/archive/master.zip",
          "https://github.com/bazelbuild/rules_cc/archive/master.zip"
      ],
    )

    http_archive(
        name = "rules_python",
        strip_prefix = "rules_python-master",
      # Use the same URL twice to trick bazel into re-trying if connection fails
      urls = [
          "https://github.com/bazelbuild/rules_python/archive/master.zip",
          "https://github.com/bazelbuild/rules_python/archive/master.zip"
      ],
    )

# ********** com_google_absl *****************
    http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/a4b757b5d42694306a9de853cee0a5fba9c7bbe9.zip","https://github.com/abseil/abseil-cpp/archive/a4b757b5d42694306a9de853cee0a5fba9c7bbe9.zip"],  # 2019-12-02T20:53:43Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "abseil-cpp-a4b757b5d42694306a9de853cee0a5fba9c7bbe9",
      sha256 = "c6a20dfedf17f3f64b090388bdb12ebdfe63e9e1e2249b813bce2e2228a77e27",
)

# ********** com_google_googletest *****************
    http_archive(
      name = "com_google_googletest",
      urls = ["https://github.com/google/googletest/archive/ae8d1fc81b1469905b3d0fa6f8a077f58fc4b250.zip","https://github.com/google/googletest/archive/ae8d1fc81b1469905b3d0fa6f8a077f58fc4b250.zip"],  # 2019-12-02T21:42:01Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "googletest-ae8d1fc81b1469905b3d0fa6f8a077f58fc4b250",
      sha256 = "e198ad2eda2a3eec285db82ee3c4055345cee32fcbfc93a93a2825e60eefd3f3",
)

# ********** com_github_google_benchmark *****************
    http_archive(
      name = "com_github_google_benchmark",
      urls = ["https://github.com/google/benchmark/archive/367119482ff4abc3d73e4a109b410090fc281337.zip","https://github.com/google/benchmark/archive/367119482ff4abc3d73e4a109b410090fc281337.zip"],  # 2019-12-02T09:29:16Z use the same URL twice to trick bazel into re-trying if connection fails
      strip_prefix = "benchmark-367119482ff4abc3d73e4a109b410090fc281337",
      sha256 = "586479d79dfb69c9a3800204585e88d621e332ab01e0f0a171bba585efa59263",
)

    # zlib pinned to 1.2.11
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
