tamatan/go-python-node-java-cpp:v-gpnjc-202205152300-g1.18.2-p3.10.4-n18.1.0-java-cpp
# 作業ディレクトリを /works にする
WORKDIR /works

# 初期設定
RUN apt update -y
RUN apt install -y wget

#
ENV CODE_SERVER_VERSION 4.4.0
# code-server のバイナリーを取得
RUN wget https://github.com/coder/code-server/releases/download/v${CODE_SERVER_VERSION}/code-server-${CODE_SERVER_VERSION}-linux-amd64.tar.gz
# code-server を /works 配下に解凍する
RUN tar -xzf code-server-${CODE_SERVER_VERSION}-linux-amd64.tar.gz -C ./ --strip-components 1

RUN apt update && \
	apt install -y curl gnupg2 ca-certificates && \
	apt install -y locales && \
	locale-gen ja_JP.UTF-8

COPY scripts /works/scripts

# Install langauge toolchains
RUN bash /works/scripts/install-tools-dev.sh

RUN cd /works/scripts && \
	bash install-vscode-extensions.sh ./install-vscode-extensions.list \

WORKDIR /works/app

EXPOSE 8080

ENTRYPOINT [ "/works/code-server", "." , "--bind-addr", "0.0.0.0:8080" ,"--locale=ja" ]
