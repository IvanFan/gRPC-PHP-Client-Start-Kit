#!/usr/bin/env bash

cp composer.json.global $HOME/.composer/composer.json
# install with composer
composer global install
echo '#### install complete'
# set PATH (add this line to your .bashrc or .zshrc.)
export PATH=$HOME/.composer/vendor/bin/:$PATH
echo '#### export complete'