ARG VARIANT="8.0-jammy"
FROM mcr.microsoft.com/devcontainers/dotnet:${VARIANT}

ARG DAFNY_VERSION=3.5.0
ARG DAFNY_ZIP=dafny-${DAFNY_VERSION}-x64-ubuntu-16.04.zip

RUN \
  cd /tmp \
  && wget https://github.com/dafny-lang/dafny/releases/download/v${DAFNY_VERSION}/${DAFNY_ZIP} \
  && unzip -d /opt/ ${DAFNY_ZIP} \
  && chmod -R +r /opt/dafny \
  && rm ${DAFNY_ZIP} 

# download tutorial to /opt/dafny/guide.md
RUN \
  curl -L https://raw.githubusercontent.com/dafny-lang/dafny/refs/tags/v${DAFNY_VERSION}/docs/OnlineTutorial/guide.md > /opt/dafny/guide.md

ENV PATH /opt/dafny:/opt/dafny/z3/bin:${PATH}

