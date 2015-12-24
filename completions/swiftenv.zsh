if [[ ! -o interactive ]]; then
  return
fi

compctl -K _swiftenv swiftenv

_swiftenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(swiftenv commands)"
  else
    completions="$(swiftenv completions ${words[2,-2]})"
  fi

  reply=(${(ps:\n:)completions})
}
