#!/bin/sh

# Copyright (C) 2020 by Michael Graves
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

VER=17

docker build --tag "asterisk:$VER" .
cat << EOF
  To start run:
 
  docker run -p 5060:5060/udp -p 5061:5061/udp -p 5060:5060/tcp -p 5061:5061/tcp -p 8088:8088/tcp -p 5038:5038/tcp --mount type=bind,source="\$(pwd)"/localdata,target=/data -d asterisk:$VER

EOF
