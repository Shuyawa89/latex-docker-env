# 基本となるイメージを指定
FROM ubuntu:22.04

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # TeX Liveとlatexmk、latexindentのインストール
    texlive-full latexmk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir
