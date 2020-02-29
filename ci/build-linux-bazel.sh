#!/usr/bin/env bash

set -e
echo "build-linux-bazel.sh:"

cd test

bazel test --curses=no //...:all

bazel test @com_google_absl//absl/...:all --test_tag_filters=-benchmark

bazel test @com_google_googletest//googletest/...:all --define absl=1

bazel test @com_github_google_benchmark//test/...:all

bazel test '--copt=-std=c++17' @com_github_google_tcmalloc//tcmalloc/...:all
