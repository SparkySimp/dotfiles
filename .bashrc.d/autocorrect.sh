# autocorrect functionality
# Function to provide filename suggestions using fzf
fzf_file_suggest() {
  local query
  query="${READLINE_LINE:0:$READLINE_POINT}"
  local selected_file
  selected_file=$(find ~/ -type f | fzf --query="$query" --preview 'bat --style=numbers --color=always {}')

  if [ -n "$selected_file" ]; then
    READLINE_LINE="${selected_file}${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#selected_file}))
  fi
}

# Bind Space key to trigger filename suggestions using fzf
# bind '" "':fzf_file_suggest # very faulty
