#!/bin/bash

PATH=/nowhere

for inp in $buildInputs; do
  PATH="$PATH:$inp/bin"
done

echo "git archiving $@"
cp -prd --no-preserve=timestamps "$@" $TMPDIR/tarball
cd $TMPDIR/tarball
git archive $(git rev-parse HEAD) -o dist.tar.gz --prefix dist/
mkdir -p $out
cp dist.tar.gz $out
