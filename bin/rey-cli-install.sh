#!/bin/sh
if test -z `ls ~/.local/bin/rey-cli 2> /dev/null`; then
  echo "Installing rey-cli..."
else
  echo "Updating rey-cli..."
fi

mkdir -p ~/.local/bin
curl -o- https://raw.githubusercontent.com/reputation-network/rey-cli/master/bin/rey-cli > ~/.local/bin/rey-cli
chmod +x ~/.local/bin/rey-cli

echo "Done! Latest rey-cli is installed at ~/.local/bin/rey-cli"

which rey-cli >&2 > /dev/null
rc=$?

if test "$rc" = 0 ; then
  echo "Type rey-cli for more information."
else
  echo "\n"'export PATH="$PATH:~/.local/bin"' >> ~/.profile
  echo "\n"'export PATH="$PATH:~/.local/bin"' >> ~/.zprofile
  echo '~/.local/bin is not in your PATH. Login again, then type rey-cli for more information.'
fi
