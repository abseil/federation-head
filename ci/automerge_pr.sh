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

readonly GCC_DOCKER="gcr.io/google.com/absl-177019/linux_gcc-latest:20200102"
readonly CLANG_DOCKER="gcr.io/google.com/absl-177019/linux_clang-latest:20200102"

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


echo "****** GCC FEDERATION TESTS **************"
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"

  if [ "${std}" = "c++17" ]; then
    # As of 2020-02-28, TCMalloc requires C++17.
    OTHER_TESTS="@com_github_google_tcmalloc//tcmalloc/...:all"
  else
    OTHER_TESTS=""
  fi

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
  ${OTHER_TESTS} \
    --define absl=1 \
    --test_tag_filters=-benchmark,-no_federation_test \
    --keep_going \
    --show_timestamps \
    --test_output=errors
done

echo "****** CLANG FEDERATION TESTS ************"
for std in ${STD}; do
  echo "*** Testing for: ${std} ***"

  if [ "${std}" = "c++17" ]; then
    # As of 2020-02-28, TCMalloc requires C++17.
    OTHER_TESTS="@com_github_google_tcmalloc//tcmalloc/...:all"
  else
    OTHER_TESTS=""
  fi

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
  ${OTHER_TESTS} \
    --define absl=1 \
    --test_tag_filters=-benchmark,-no_federation_test \
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

  CURL_HTTP_STATUS=$(curl -s -o response0.txt -w '%{http_code}' https://api.github.com/repos/abseil/federation-head/pulls/${KOKORO_GITHUB_PULL_REQUEST_NUMBER})
  if [ ${CURL_HTTP_STATUS} -ne 200 ]; then
    echo "Failed to get GitHub Pull Request ${KOKORO_GITHUB_PULL_REQUEST_NUMBER}. See GitHub response below:"
    cat response0.txt
    echo "Terminating with -1"
    exit -1
  fi
  GITHUB_PR_AUTHOR=$(cat response0.txt | python3 -c "import sys, json; print(json.load(sys.stdin)['user']['login'])")
  if [ ${GITHUB_PR_AUTHOR} != ${ALLOWED_AUTOMERGE_PR_AUTHOR} ]; then
    echo "Exiting without Auto-Merge. Only pull requests from ${ALLOWED_AUTOMERGE_PR_AUTHOR} are auto-merged. This PR is authored by ${GITHUB_PR_AUTHOR}."
    exit 0
  fi

  echo "PR Author ${GITHUB_PR_AUTHOR} valid. Proceeding..."

  NETRC_FILE="$KOKORO_KEYSTORE_DIR"/73103_absl-federation-github-access_token_netrcfile
  GITHUB_API_STATUS=$(curl --netrc-file "${NETRC_FILE}" -s -o response.txt -i -w '%{http_code}' -X PUT  --data "$(generate_post_data)" https://api.github.com/repos/abseil/federation-head/pulls/"${KOKORO_GITHUB_PULL_REQUEST_NUMBER}"/merge )

  if [ ${GITHUB_API_STATUS} -ne 200 ]; then
    echo "Build Successful but PR Merge failed. See GitHub response below:"
    cat response.txt
    echo "Terminating with -1"
    exit -1
  fi
  echo "PR Merge has been completed, Proceeding with GitHub Release..."

  GITHUB_API_STATUS=$(curl --netrc-file "${NETRC_FILE}" -s -o response1.txt -i -w '%{http_code}' -X POST --data "$(generate_post_data_create_github_release)" https://api.github.com/repos/abseil/federation-head/releases)

  if [ ${GITHUB_API_STATUS} -ne 201 ]; then
    echo "GitHub Merge was Successful but making a GitHub Release failed. See GitHub response below:"
    cat response1.txt
    echo "Terminating with -1"
    exit -1
  fi
  echo "PR Merge has been completed, Proceeding with GitHub Release..."

else
  echo "AUTOMERGE is not set, Skipping PR merge..."
fi
