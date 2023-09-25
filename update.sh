#!/bin/bash

# Requires jq for JSON parsing
# apt install jq

set -euo pipefail
set -x

# Deduplicates tokens by chainId and address
function deduplicate {
  infile=$1
  outfile=$2
  jq '.[].address |= ascii_downcase | unique_by(.chainId,.address)' $infile > $outfile
}

# Loads tokens from a local JSON file
function loadLocalTokens {
  infile=$1
  outfile=$2
  jq '.' $infile > $outfile
}

# List of all local overlay files
localFiles=("lab10_ethereum_overlay.json" "lab10_arbitrum_overlay.json" "lab10_avalanche_overlay.json" "lab10_bnbchain_overlay.json" "lab10_celo_overlay.json" "lab10_gnosis_overlay.json" "lab10_optimism_overlay.json" "lab10_polygon_overlay.json" "lab10_polygonzkevm_overlay.json" "lab10_zksyncera_overlay.json")

# Temporary array to hold all local files after loading
tempFiles=()

# Load each local file and add to the temporary array
for i in "${localFiles[@]}"; do
  tempFile="temp_${i}"
  loadLocalTokens "$i" "$tempFile"
  tempFiles+=("$tempFile")
done

# Flatten all files into one
jq -s '.|flatten' "${tempFiles[@]}" > combined.json

# Deduplicate
deduplicate combined.json all.json

# Cleanup
rm -f "${tempFiles[@]}"

# Output the number of tokens in the final list
echo "Built list with $(jq '.|length' all.json) elements"
