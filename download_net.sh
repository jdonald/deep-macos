#! /bin/sh

if [ ! -e $HOME/words_1000_ascii.t7 ];then
  echo Will download words_1000_ascii.t7
  curl -L https://github.com/vfonov/deep-pi/releases/download/v1/words_1000_ascii.t7 -o $HOME/words_1000_ascii.t7
  echo Downloaded $HOME/words_1000_ascii.t7
fi

if [ ! -e $HOME/nin_bn_final.t7 ];then
  echo Will download nin_bn_final.t7 , WARNING: 33.1MB!
  curl -L https://www.dropbox.com/s/mclw90yba6eml60/nin_bn_final.t7 -o $HOME/nin_bn_final.t7
  echo Downloaded $HOME/nin_bn_final.t7
fi
