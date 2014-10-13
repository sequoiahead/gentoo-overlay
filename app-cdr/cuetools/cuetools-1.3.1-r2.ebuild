# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/cuetools/cuetools-1.3.1-r1.ebuild,v 1.1 2009/06/20 22:10:05 flameeyes Exp $

inherit eutils

DESCRIPTION="Utilities to manipulate and convert cue and toc files"
HOMEPAGE="http://developer.berlios.de/projects/cuetools/"
SRC_URI="mirror://berlios/${PN}/${P}.tar.gz
	mirror://gentoo/${P}-debian.patch.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="tools"

RDEPEND="
	tools? ( media-libs/flac )"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${WORKDIR}/${P}-debian.patch"
	if use tools ; then
		epatch "${FILESDIR}/${P}-flac-1.2.1.patch"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS NEWS README TODO || die
	docinto extras
	if use tools ; then 
		dobin extras/cuetag.sh || die
	fi
	dodoc extras/{cue{convert.cgi,tag.sh},*.txt} || die
}
