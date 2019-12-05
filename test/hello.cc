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

#include <cstdlib>
#include <string>

#include "absl/strings/str_cat.h"
#include "absl/strings/string_view.h"
#include "zlib.h"

namespace hello {

std::string Greet(absl::string_view person) {
  return absl::StrCat("Hello ", person);
}

std::string zCompress(const std::string& str_in) {
  z_stream defstream;
  defstream.zalloc = Z_NULL;
  defstream.zfree = Z_NULL;
  defstream.opaque = Z_NULL;
  if (deflateInit(&defstream, Z_BEST_COMPRESSION) != Z_OK) {
    std::abort();
  }

  defstream.avail_in = (uInt)str_in.size();
  defstream.next_in = (Bytef *)str_in.data();

  int ret = 0;
  std::string output;
  do {
    char buf[64];
    defstream.next_out = reinterpret_cast<Bytef*>(buf);
    defstream.avail_out = sizeof(buf);
    ret = deflate(&defstream, Z_FINISH);
    if (output.size() < defstream.total_out) {
      output.append(buf, defstream.total_out - output.size());
    }
  } while (ret == Z_OK);

  deflateEnd(&defstream);

  if (ret != Z_STREAM_END) {
    std::abort();
  }

  return output;
}

}  // namespace hello
