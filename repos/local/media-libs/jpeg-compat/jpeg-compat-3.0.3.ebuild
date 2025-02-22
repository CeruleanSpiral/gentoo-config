# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib

MY_PN="libjpeg-turbo"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Accelerated JPEG library (libjpeg.so.8 ABI provided by libjpeg-turbo)"
HOMEPAGE="https://libjpeg-turbo.org/ https://sourceforge.net/projects/libjpeg-turbo/"
SRC_URI="https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${PV}/${MY_P}.tar.gz"
#SRC_URI="mirror://sourceforge/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD IJG ZLIB"
SLOT="8"
KEYWORDS="~amd64 ~x86"

ASM_DEPEND="|| ( dev-lang/nasm dev-lang/yasm )"

BDEPEND="
    app-misc/pax-utils
    amd64? ( ${ASM_DEPEND} )
    x86? ( ${ASM_DEPEND} )
"

RDEPEND="
    !media-libs/jpeg:${SLOT}
    !=media-libs/jpeg-${SLOT}*:0
    !<media-libs/libjpeg-turbo-1.3.0-r2
"

S="${WORKDIR}/${MY_P}"
DOCS=()

multilib_src_configure() {
    local mycmakeargs=(
        -DENABLE_STATIC=NO
        -DWITH_JAVA=NO
        -DWITH_JPEG${SLOT}=YES
    )

    cmake_src_configure
}

multilib_src_compile() {
    cmake_src_compile libjpeg.so.${SLOT}
    scanelf -BXr libjpeg.so.${SLOT} >/dev/null || die
}

multilib_src_install() {
    dolib.so libjpeg.so.${SLOT}*
}
