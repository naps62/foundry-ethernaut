set positional-arguments

script-args := '--ffi --rpc-url $ETH_RINKEBY_URL --broadcast --private-key $ETH_RINKEBY_PRIV_KEY -vvv'

alias t := test

selector sig:
  #!/bin/sh
  sig=$(cast sig $1)
  echo -n $sig | xclip -selection clipboard
  echo $sig "(copied to clipboard)"

test *args='':
  forge test --ffi --fork-url $ETH_RINKEBY_URL --fork-block-number $ETH_BLOCK_NUMBER $@

ethernaut id:
  forge script test/$1*.sol {{script-args}} --tc Ethernaut $1

ethernaut-slow id:
  forge script test/$1*.sol {{script-args}} --tc Ethernaut$1 --slow

status:
  node scripts/status.js