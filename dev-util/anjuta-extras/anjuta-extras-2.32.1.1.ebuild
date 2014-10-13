# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit gnome2

DESCRIPTION="Anjuta IDE Extras features"
HOMEPAGE="http://www.anjuta.org"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/anjuta-extras/2.32/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nls valgrind graphviz scintilla"

DEPEND=">=dev-util/anjuta-2.32.0.0
	>=gnome-base/libgnomecanvas-2.12.0
	valgrind? ( dev-util/valgrind )
	graphviz? ( >=media-gfx/graphviz-2.6.0 )
	scintilla? ( app-editors/scite )
	"
RDEPEND="${DEPEND}"

src_configure() {
	if ! use nls ; then
		G2CONF="${G2CONF} --disable-nls"
	fi
	if ! use valgrind ; then
		G2CONF="${G2CONF} --disable-plugin-valgrind"
	fi
	if ! use scintilla ; then
		G2CONF="${G2CONF} --disable-plugin-scintilla"
	fi
	G2CONF="${G2CONF} $(use_enable graphviz)"
	gnome2_src_configure
}
