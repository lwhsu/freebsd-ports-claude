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

# dependencies:
# 7-zip
# icoutils
# npm-node20

#USES=	nodejs tar:tgz

SUB_FILES=	${PORTNAME}

do-extract:
	${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/${DISTFILES} ${WRKSRC}
	${CP} ${FILESDIR}/build.sh ${FILESDIR}/install-icons.sh ${WRKSRC}

do-build:
	cd ${WRKSRC} && env FILESDIR=${FILESDIR} ./build.sh

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/resources
	${INSTALL_DATA} ${WRKSRC}/electron-app/app.asar ${STAGEDIR}${DATADIR}/resources
	cd ${WRKSRC}/electron-app && \
		${COPYTREE_SHARE} app.asar.unpacked ${STAGEDIR}${DATADIR}/resources
	${INSTALL_DATA} ${FILESDIR}/${PORTNAME}.desktop ${STAGEDIR}${DESKTOPDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	cd ${WRKSRC} && \
		env ICONSDIR=${STAGEDIR}${PREFIX}/share/icons ./install-icons.sh

.include <bsd.port.options.mk>

.if ${ARCH} == "amd64"
MASTER_SITE_SUBDIR=	nest-win-x64
DISTFILES=	Claude-Setup-x64.exe
.elif ${ARCH} == "arm64"
MASTER_SITE_SUBDIR=	nest-win-arm64
DISTFILES=	Claude-Setup-arm64.exe
.endif

.include <bsd.port.mk>
