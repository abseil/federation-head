cc_library(
    name = "hello",
    srcs = ["hello.cc"],
    hdrs = ["hello.h"],
    deps = [
        "@com_google_absl//absl/strings",
        "@net_zlib//:zlib",
    ],
)

cc_test(
    name = "hello_test",
    srcs = ["hello_test.cc"],
    deps = [
        ":hello",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "hello_test_z",
    srcs = ["hello_test_z.cc"],
    deps = [
        ":hello",
        "@com_google_googletest//:gtest_main",
        "@net_zlib//:zlib",
    ],
)

# This could be cc_binary, but we'd like to run it as part of our automated
# testing to be sure it doesn't crash.
cc_test(
    name = "hello_main",
    srcs = ["hello_main.cc"],
    deps = [
        ":hello",
        "@com_google_absl//absl/debugging:failure_signal_handler",
        "@com_google_absl//absl/strings:str_format",
        "@com_google_absl//absl/time",
    ],
)
