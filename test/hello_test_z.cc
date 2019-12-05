// Copyright 2018 Google Inc.  All rights reserved
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "hello.h"

#include <cstdlib>
#include <string>

#include "gtest/gtest.h"
#include "zlib.h"

namespace {

std::string zDecompress(absl::string_view str_in) {
  z_stream infstream;
  infstream.zalloc = Z_NULL;
  infstream.zfree = Z_NULL;
  infstream.opaque = Z_NULL;
  if (inflateInit(&infstream) != Z_OK) {
    std::abort();
  }

  infstream.avail_in = (uInt)str_in.size();
  infstream.next_in = (Bytef *)str_in.data();

  int ret = 0;
  std::string output;
  do {
    char buf[64];
    infstream.next_out = reinterpret_cast<Bytef*>(buf);
    infstream.avail_out = sizeof(buf);
    ret = inflate(&infstream, 0);
    if (output.size() < infstream.total_out) {
      output.append(buf, infstream.total_out - output.size());
    }
  } while (ret == Z_OK);

  inflateEnd(&infstream);

  if (ret != Z_STREAM_END) {
    std::abort();
  }

  return output;
}

TEST(Compressor, Compresses) {
  const char hellos[] =
      "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello";
  EXPECT_EQ(zDecompress(hello::zCompress(hellos)), hellos);
}

TEST(Compressor, LongString) {
  std::string very_long(5000, 'a');  // "aaaa..."
  EXPECT_EQ(very_long, zDecompress(hello::zCompress(very_long)));
}

}  // namespace
