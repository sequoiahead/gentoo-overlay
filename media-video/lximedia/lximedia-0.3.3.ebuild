# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="A DLNA compatible, fully transcoding, media server designed for
serving media (movies, TV shows, music, photos) to DLNA compliant televisions
and media players (Streamium, PS3, XBox 360). Also subtitles and audio language
selection are supported."
HOMEPAGE="http://sourceforge.net/apps/mediawiki/lximedia/index.php?title=Main_Page"
SRC_URI="mirror://sourceforge/lximedia/lximedia_${PV}-1.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/qt-webkit
x11-libs/qt-test
media-sound/pulseaudio
media-video/ffmpeg
media-libs/libexif
media-libs/libdvdnav
media-libs/freetype
net-fs/samba[smbclient]
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-notest.patch
}

src_compile() {
	qmake
	emake || die
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
	newinitd "${FILESDIR}"/lximedia.init.d lximedia

	doicon "${FILESDIR}"/lximedia.png
	domenu "${FILESDIR}"/lximedia.desktop
}

