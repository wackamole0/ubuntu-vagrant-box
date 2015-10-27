#!/bin/bash

curdir=`pwd`
dir=`dirname $0`
box="wackamole/trusty64"
package="wackamole-trusty64.box"

cd "$dir"

vagrant up

if [ -f "$package" ]; then
  unlink "$package"
fi

vagrant package --output "$package"

if [ "`vagrant box list | fgrep $box`" != "" ]; then
  vagrant box remove "$box"
fi

vagrant box add "$box" "$package"

cd "$curdir"
