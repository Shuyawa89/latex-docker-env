# 基本となるイメージを指定
FROM ubuntu:22.04

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # TeX Liveとlatexmk、latexindentのインストール
    texlive-lang-japanese texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra latexmk texlive-extra-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir
