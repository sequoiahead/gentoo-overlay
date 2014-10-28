# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A multi-platform framework for building 2d games, interactive books, demos and other graphical applications. It works on iOS, Android, Windows Phone, OS X, Windows and Linux."
HOMEPAGE="http://www.cocos2d-x.org"
SRC_URI="http://www.cocos2d-x.org/filedown/cocos2d-x-${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/unzip
	dev-lang/python:2.7
	dev-util/android-ndk
	dev-java/ant-core

	x11-libs/libX11
	x11-libs/libXmu
	media-libs/glu
	x11-libs/gl2ps
	x11-libs/libXi
	sys-devel/gcc
	dev-libs/libzip
	media-libs/libpng:1.2
	net-misc/curl
	media-libs/fontconfig
	dev-db/sqlite
	media-libs/glew
	dev-libs/openssl
	"
RDEPEND="${DEPEND}"

COCOS_DIR="${ROOT}opt/${PN}"
ENVD_FILE="${T}/99${PN}"

src_install() {
	dodir ${COCOS_DIR}
	insinto ${COCOS_DIR}
	doins -r build cocos extensions plugin templates tools

	COCOS_CONSOLE_ROOT="${COCOS_DIR}/tools/cocos2d-console/bin"
	
	echo "COCOS_CONSOLE_ROOT=${COCOS_CONSOLE_ROOT}" >> ${ENVD_FILE}
	echo "NDK_ROOT=/opt/android-ndk" >> ${ENVD_FILE}
	echo "ANDROID_SDK_ROOT=/opt/android-sdk-update-manager" >> ${ENVD_FILE}
	echo "ANT_ROOT=/usr/bin" >> ${ENVD_FILE}
	echo "PATH=${COCOS_CONSOLE_ROOT}" >> ${ENVD_FILE}

	doenvd ${ENVD_FILE}
}
