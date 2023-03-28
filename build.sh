#!/bin/bash
exec 2>&1
rm -rf dist/ peerjs/

git clone https://github.com/peers/peerjs peerjs
cd peerjs

git checkout 9aaf86fe90e5f53bae2ae86bc6b49a261b9001d9
git apply ../decoupling.diff
../node_modules/.bin/parcel build --no-source-maps lib/exports.ts -d ../dist --out-file peerjs.min.js

cd ../
cat imports.js dist/peerjs.min.js > dist/react-native-peerjs.js

rm dist/peerjs.min.js
rm -rf peerjs/

echo "Done. dist/react-native-peerjs.js"