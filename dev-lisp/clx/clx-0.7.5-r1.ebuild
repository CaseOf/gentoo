# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="CLX is the Common Lisp interface to the X11 protocol primarily for SBCL"
HOMEPAGE="https://www.cliki.net/CLX"
SRC_URI="https://github.com/sharplispers/clx/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND="sys-apps/texinfo
	doc? ( virtual/texi2dvi )"

src_compile() {
	cd manual || die
	makeinfo ${PN}.texinfo -o ${PN}.info || die
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texinfo -o ${PN}.pdf || die
	fi
}

src_install() {
	common-lisp-install-sources *.lisp debug demo extensions tests
	common-lisp-install-asdf
	dodoc NEWS CHANGES README*
	doinfo manual/${PN}.info
	use doc && dodoc manual/${PN}.pdf
}
