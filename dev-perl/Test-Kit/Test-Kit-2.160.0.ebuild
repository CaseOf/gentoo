# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=KAORU
DIST_VERSION=2.16
inherit perl-module

DESCRIPTION="Build custom test packages with only the features you want"
SLOT="0"
KEYWORDS="~amd64 ~riscv ~x86 ~x64-macos"

RDEPEND="
	virtual/perl-Exporter
	dev-perl/Hook-LexWrap
	dev-perl/Import-Into
	dev-perl/Module-Runtime
	virtual/perl-Scalar-List-Utils
	dev-perl/Sub-Delete
	virtual/perl-Test-Simple
"
BDEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		dev-perl/Test-Exception
		dev-perl/Test-NoWarnings
		dev-perl/Test-Output
		>=virtual/perl-Test-Simple-0.920.0
		dev-perl/Test-Warn
	)
"
PERL_RM_FILES=(
	"t/author-pod-syntax.t"
	"t/release-cpan-changes.t"
)
