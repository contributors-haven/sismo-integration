#!/bin/sh
echo "start"

# This script generates the ABI files for the contracts in the project.
# It is intended to be run from the project root directory
# the generated ABI will be used to call the contracts from the frontend
#mkdir -p ./../abi/
#touch ./../abi/Airdrop.json && touch ./../abi/CheckMembership.json

#echo "{\n  \"abi\": $(forge inspect Airdrop abi)\n}" >| ./../abi/Airdrop.json
#echo "{\n  \"abi\": $(forge inspect CheckMembership abi)\n}" >| ./../abi/CheckMembership.json