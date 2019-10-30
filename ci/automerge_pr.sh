#!/bin/bash
#
# Copyright 2019 The Abseil Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script that can be invoked to test federation head in a hermetic
# environment using a Docker image on Linux. You must have Docker installed
# to use this script.

set -euox pipefail

BUILD_ROOT="$(realpath $(dirname ${0})/..)"

readonly GCC_DOCKER="gcr.io/google.com/absl-177019/linux_gcc-latest:20190703"
readonly CLANG_DOCKER="gcr.io/google.com/absl-177019/linux_clang-latest:20191018"

################################### START TESTS ################################

if [ -z ${STD:-} ]; then
  STD="c++11 c++14 c++17"
fi

echo "************************ GCC FEDERATION SMOKE TESTS *******************"
# Runs with --copt=-Werror so not combined with abseil,googletest, benchmark
# tests below
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"
  time docker run  \
  --volume="${BUILD_ROOT}:/repo_root:ro"  \
  --workdir=/repo_root/test \
  --cap-add=SYS_PTRACE \
  --rm \
  -e CC="/usr/local/bin/gcc" \
  -e BAZEL_CXXOPTS="-std=${std}" \
  "${GCC_DOCKER}" \
  /usr/local/bin/bazel test ... \
    --copt=-Werror \
    --keep_going \
    --show_timestamps \
    --test_output=errors
done


echo "************************ CLANG FEDERATION SMOKE TESTS *****************"
# Runs with --copt=-Werror so not combined with abseil,googletest, benchmark
# tests below
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"
  time docker run  \
  --volume="${BUILD_ROOT}:/repo_root:ro"  \
  --workdir=/repo_root/test \
  --cap-add=SYS_PTRACE \
  --rm \
  -e CC="/opt/llvm/clang/bin/clang" \
  -e BAZEL_COMPILER="llvm" \
  -e BAZEL_CXXOPTS="-std=${std}" \
  "${CLANG_DOCKER}" \
  /usr/local/bin/bazel test ... \
    --copt=-Werror \
    --keep_going \
    --show_timestamps \
    --test_output=errors
done


echo "****** GCC FEDERATION TESTS ABSEIL, GOOGLETEST, BENCHMARK  **************"
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"
  time docker run  \
  --volume="${BUILD_ROOT}:/repo_root:ro"  \
  --workdir=/repo_root/test \
  --cap-add=SYS_PTRACE \
  --rm \
  -e CC="/usr/local/bin/gcc" \
  -e BAZEL_CXXOPTS="-std=${std}" \
  "${GCC_DOCKER}" \
  /usr/local/bin/bazel test \
  @com_google_absl//absl/...:all \
  @com_google_googletest//googletest/...:all \
  @com_github_google_benchmark//test/...:all \
    --define absl=1 \
    --test_tag_filters=-benchmark \
    --keep_going \
    --show_timestamps \
    --test_output=errors
done

echo "****** CLANG FEDERATION TESTS ABSEIL, GOOGLETEST, BENCHMARK  ************"
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"
  time docker run  \
  --volume="${BUILD_ROOT}:/repo_root:ro"  \
  --workdir=/repo_root/test \
  --cap-add=SYS_PTRACE \
  --rm \
  -e CC="/opt/llvm/clang/bin/clang" \
  -e BAZEL_COMPILER="llvm" \
  -e BAZEL_CXXOPTS="-std=${std}" \
  "${CLANG_DOCKER}" \
  /usr/local/bin/bazel test \
  @com_google_absl//absl/...:all \
  @com_google_googletest//googletest/...:all \
  @com_github_google_benchmark//test/...:all \
    --define absl=1 \
    --test_tag_filters=-benchmark \
    --keep_going \
    --show_timestamps \
    --test_output=errors
done


################################### END TESTS ##################################

generate_post_data()
{
cat <<EOF
{"commit_title":"Auto-Merge of PR ${KOKORO_GITHUB_PULL_REQUEST_NUMBER}", "commit_message": "Virtual Head Update","sha":"$KOKORO_GITHUB_PULL_REQUEST_COMMIT", "merge_method":"merge"}
EOF
}

RELEASE_TAG=$("date" +%Y-%m-%d-daily)
generate_post_data_create_github_release()
{
cat <<EOF
{"tag_name":"$RELEASE_TAG", "target_commitish": "master","name":"$RELEASE_TAG"}
EOF
}


# The following variables will be defined when running on Kokoro
# KOKORO_GITHUB_PULL_REQUEST_NUMBER
# KOKORO_GITHUB_PULL_REQUEST_COMMIT
# KOKORO_KEYSTORE_DIR
# For testing outside Kokoro set them in your test environment

# AUTOMERGE variable will be set on Kokoro
# For testing outside Kokoro set it in your test environment
if [ ${AUTOMERGE:-0} -ne 0 ]; then
  echo "AUTOMERGE is set: ${AUTOMERGE}, Proceeding with PR merge..."
  NETRC_FILE="$KOKORO_KEYSTORE_DIR"/73103_absl-federation-github-access_token_netrcfile
  curl --netrc-file "${NETRC_FILE}" -X PUT --data "$(generate_post_data)" https://api.github.com/repos/abseil/federation-head/pulls/"${KOKORO_GITHUB_PULL_REQUEST_NUMBER}"/merge

  echo "PR Merge has been completed, Proceeding with GitHub Release..."
  curl --netrc-file "${NETRC_FILE}" -X POST --data "$(generate_post_data_create_github_release)" https://api.github.com/repos/abseil/federation-head/releases

else
  echo "AUTOMERGE is not set, Skipping PR merge..."
fi
