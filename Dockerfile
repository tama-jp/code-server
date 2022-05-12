FROM debian:bullseye-20220418

# 作業ディレクトリを /works にする
WORKDIR /works

COPY scripts /works/scripts

# code-server を取得するのに wget を install しておく
RUN apt update && \
    apt install -y wget

ENV CODE_SERVER_VERSION 4.4.0
# code-server のバイナリーを取得
RUN wget https://github.com/coder/code-server/releases/download/v${CODE_SERVER_VERSION}/code-server-${CODE_SERVER_VERSION}-linux-amd64.tar.gz
# code-server を /works 配下に解凍する
RUN tar -xzf code-server-${CODE_SERVER_VERSION}-linux-amd64.tar.gz -C ./ --strip-components 1

RUN apt update && \
	apt install -y curl gnupg2 ca-certificates && \
	apt install -y locales && \
	locale-gen ja_JP.UTF-8

RUN cd /works/scripts && \
	sh install-vscode-extensions.sh ./extensions.list

# Install langauge toolchains
RUN sh /works/scripts/install-tools-nodejs.sh
RUN sh /works/scripts/install-tools-dev.sh
RUN sh /works/scripts/install-tools-golang.sh
RUN sh /works/scripts/install-tools-cpp.sh
RUN sh /works/scripts/install-tools-python.sh
RUN sh /works/scripts/install-tools-java.sh

EXPOSE 8080

CMD [ "/works/code-server", "." , "--bind-addr", "0.0.0.0:8080" ,"--locale=ja" ]
