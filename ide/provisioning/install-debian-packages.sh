#!/bin/sh

set -e

# To prevent apt from displaying dialogs
DEBIAN_FRONTEND=noninteractive
APTOPTS="--no-install-recommends --assume-yes"

echo Updating Repositories
apt-get update

echo Installing base dependencies...
apt-get install $APTOPTS make \
  librsvg2-bin xsltproc \
  imagemagick gettext ffmpeg \
  git quilt unzip zip \
  m4 automake wget \
  ttf-bitstream-vera fakeroot
echo

echo Installing Manual dependencies...
apt-get install $APTOPTS texlive \
  texlive-latex-extra \
  texlive-luatex \
  texlive-lang-french \
  texlive-lang-polish \
  texlive-lang-portuguese \
  texlive-lang-german \
  liblocale-po-perl
echo

echo Installing dependencies for the Linux target...
apt-get install $APTOPTS make g++ \
  zlib1g-dev \
  libfreetype6-dev \
  libpng-dev libjpeg-dev \
  libtiff5-dev libgeotiff-dev \
  libcurl4-openssl-dev \
  liblua5.2-dev lua5.2-dev \
  libxml-parser-perl \
  libasound2-dev \
  librsvg2-bin xsltproc \
  imagemagick gettext \
  mesa-common-dev libgl1-mesa-dev libegl1-mesa-dev \
  fonts-dejavu
echo

echo Installing dependencies for compiling with LLVM / Clang...
apt-get install $APTOPTS llvm clang libc++-dev
echo

echo Installing dependencies for compiling targets which need libinput or GBM...
apt-get install $APTOPTS libinput-dev libgbm-dev
echo

echo Installing dependencies for ARM Linux targets...
apt-get install $APTOPTS g++-arm-linux-gnueabihf
echo

echo Installing PC/WIN64 dependencies...
apt-get install $APTOPTS g++-mingw-w64
echo

echo Installing dependencies for the Android target, not including SDK / NDK...
apt-get install $APTOPTS default-jdk-headless vorbis-tools adb libtool
echo

echo Installing dependencies for KOBO
apt-get --assume-yes install libav-tools
apt-get --assume-yes install ccache
echo

echo Clean up downloaded resources in order to free space
apt-get clean 
echo 
