################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="rpi-fbcp"
PKG_VERSION="master"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://192.168.0.14/openelec/depots/rpi-fbcp-0.1.tar.gz"
PKG_URL="http://192.168.0.14/openelec/depots/rpi-fbcp-0.1.tar.gz"
PKG_SOURCE_DIR="rpi-fbcp-0.1"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="fbcp copy primary framebuffer into secondary"
PKG_LONGDESC="fbcp copy primary framebuffer into secondary"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

export CFLAGS="$CFLAGS \
         -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads/ \
         -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"
export CXXFLAGS="$CXXFLAGS \
           -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads/ \
           -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

# package specific configure options
configure_target() {
  cmake ..
}

make_target() {
    make CC=$TARGET_CC \
      RANLIB=$TARGET_RANLIB \
      AR=$TARGET_AR \
      STRIP=$TARGET_STRIP \
      CFLAGS="$CFLAGS"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp fbcp $INSTALL/usr/bin
    $STRIP $INSTALL/usr/bin/fbcp
}

