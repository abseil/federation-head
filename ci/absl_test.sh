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

# This script that can be invoked to test abseil-cpp in a hermetic environment
# using a Docker image on Linux. You must have Docker installed to use this
# script.

set -euox pipefail

BUILD_ROOT="$(realpath "$(dirname "${0}")"/..)"

readonly DOCKER_CONTAINER="gcr.io/google.com/absl-177019/linux_gcc-latest:20190703"

docker run  --volume="${BUILD_ROOT}:/test:ro"  --workdir=/test/test "${DOCKER_CONTAINER}" /usr/local/bin/bazel test @com_google_absl//absl/...:all --test_output=errors --test_tag_filters=-benchmark
