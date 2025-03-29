PORTNAME=	claude-code
DISTVERSION=	0.2.56
CATEGORIES=	devel
MASTER_SITES=	#
DISTNAME=	anthropic-ai-claude-code-${DISTVERSION}

MAINTAINER=	lwhsu@FreeBSD.org
COMMENT=	Agentic coding tool that lives in your terminal
WWW=		https://github.com/anthropics/claude-code

LICENSE=	EULA
LICENSE_NAME=	End User License Agreement
LICENSE_TEXT=	See https://www.anthropic.com/legal/commercial-terms
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

USES=	nodejs tar:tgz

NO_BUILD=	yes
WRKSRC=	${WRKDIR}/package

PLIST_FILES=	bin/claude \
		libexec/claude-code/cli.js \
		libexec/claude-code/yoga.wasm \

pre-fetch:
	if [ ! -f ${DISTDIR}/${DISTFILES} ]; then \
		${MKDIR} ${WRKDIR}; \
		npm pack @anthropic-ai/claude-code; \
		${MV} ${DISTFILES} ${DISTDIR}; \
		${RM} -r ${WRKDIR}; \
	fi

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/libexec/claude-code
	${INSTALL_SCRIPT} ${WRKSRC}/cli.js ${STAGEDIR}${PREFIX}/libexec/claude-code/
	${INSTALL_DATA} ${WRKSRC}/yoga.wasm ${STAGEDIR}${PREFIX}/libexec/claude-code/
	${LN} -sf ../libexec/claude-code/cli.js ${STAGEDIR}/${PREFIX}/bin/claude

.include <bsd.port.mk>
