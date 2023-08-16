while IFS= read -r line; do
  if [[ "$line" == *"."* ]]; then
    `touch $line`
  else
  `mkdir -p $line`
  fi
  #printf '%s\n' "$line"
done < destro.txt
