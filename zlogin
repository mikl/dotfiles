if  [ -f /usr/local/bin/fortune ] && [ -f /usr/local/bin/cowsay ]; then
  fortune -o | cowsay
fi
