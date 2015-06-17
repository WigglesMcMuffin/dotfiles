if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

keychain DC1CA68D ~/.ssh/id_rsa
