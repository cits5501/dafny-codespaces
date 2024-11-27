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

ENV PATH /opt/dafny:/opt/dafny/z3/bin:${PATH}
