#!/bin/bash

# stop on error
set -eu

# if another user is given
usermod  -u $UID bitcoind
groupmod -g $GID bitcoind

chown -R bitcoind:bitcoind /home/bitcoind

# if the arguments start with - assume additional parameters for bitcoind
if [[ "$1" =~ ^- ]]; then
	CMD=bitcoind
else # otherwise run given command
	CMD=$1; shift
fi

echo "CMD: $CMD ARGS: $@"
if [[ "$CMD" =~ ^bitcoin ]]; then
	echo "Run as bitcoind user"
	exec sudo -u bitcoind "$CMD" "$@"
else
	echo "Run as root user"
	exec "$CMD" "$@"
fi
