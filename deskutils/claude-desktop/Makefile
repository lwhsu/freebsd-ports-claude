PORTNAME=	claude-desktop
DISTVERSION=	0.9.0
CATEGORIES=	deskutils
MASTER_SITES=	https://storage.googleapis.com/osprey-downloads-c02f6a0d-347c-492b-a752-3e0651722e97/%SUBDIR%/

MAINTAINER=	lwhsu@FreeBSD.org
COMMENT=	Claude on your desktop
WWW=		https://claude.ai/download

LICENSE=	EULA
LICENSE_NAME=	End User License Agreement
LICENSE_TEXT=	See https://www.anthropic.com/legal/commercial-terms
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

ONLY_FOR_ARCHS=	amd64 arm64
ONLY_FOR_ARCHS_REASON=	Only amd64 and arm64 binary available

#USES=	nodejs tar:tgz

do-extract:
	${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/${DISTFILES} ${WRKSRC}
	${CP} ${FILESDIR}/build.sh ${FILESDIR}/install.sh ${WRKSRC}

do-build:
	${CP} -f ${FILESDIR}/build.sh ${WRKSRC} #XXX
	cd ${WRKSRC} && env PREFIX=${PREFIX} FILESDIR=${FILESDIR} ./build.sh

do-install:
	${CP} -f ${FILESDIR}/install.sh ${WRKSRC} #XXX
	cd ${WRKSRC} && env PREFIX=${PREFIX} FILESDIR=${FILESDIR} ./install.sh
# Create desktop entry
# ${FILESDIR}/claude-desktop.desktop
# ${INSTALL_DATA} ${FILESDIR}/${PORTNAME}.desktop ${STAGEDIR}${DESKTOPDIR}

# Create launcher script with Wayland flags
# ${FILESDIR}/claude-desktop.in
# SUB_FILES=      ${PORTNAME}
# ${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.options.mk>

.if ${ARCH} == "amd64"
MASTER_SITE_SUBDIR=	nest-win-x64
DISTFILES=	Claude-Setup-x64.exe
.elif ${ARCH} == "arm64"
MASTER_SITE_SUBDIR=	nest-win-arm64
DISTFILES=	Claude-Setup-arm64.exe
.endif

.include <bsd.port.mk>
