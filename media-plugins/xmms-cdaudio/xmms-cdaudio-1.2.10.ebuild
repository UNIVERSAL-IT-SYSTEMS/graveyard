# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-cdaudio/xmms-cdaudio-1.2.10.ebuild,v 1.4 2005/03/16 05:56:47 eradicator Exp $

IUSE="ipv6 oss"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"

DEPEND=">=media-sound/xmms-1.2.10"

PLUGIN_PATH="Input/cdaudio"

M4_VER="1.1"

inherit xmms-plugin

src_unpack() {
	xmms-plugin_src_unpack

	cd ${S}/${PLUGIN_PATH}
	cp ${S}/Output/OSS/soundcard.h .

	sed -i 's:<Output/OSS/soundcard.h>:"soundcard.h":' *.{h,c}
}

src_compile() {
	myconf="${myconf} --enable-cdaudio $(use_enable ipv6) $(use_enable oss)"
	xmms-plugin_src_compile
}
