#!/usr/bin/env sh

cat ./contracts/am-on-the-fork.sol > ./build/deploy.sol
cat ./contracts/owned.sol >> ./build/deploy.sol
cat ./contracts/ether-transfer.sol >> ./build/deploy.sol