#!/bin/sh
find . -type d -regextype egrep -regex './[^/]+/[^/]+' | \
  xargs -i sh -c 'echo -n {}": "; cd {}; git pull && git submodule update --init --recursive'
