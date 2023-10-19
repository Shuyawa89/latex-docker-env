# LaTeX Docker Environment

## Overview
このリポジトリは、TeX Liveを使用したLaTeX環境をDockerで構築するためのものです。VSCodeの拡張機能を用いることで、ほとんど環境構築することなく、LaTeXを利用することができます。

また、VSCodeを利用しない場合でも、Latexで作成されたファイルをDockerイメージ上でコンパイルすることができます。その場合はTerminalでdockerコマンドを実行し、コンテナ内で実行してください。

## Environment

| Software | Version |
| -------- | ------- |
| OS (Ubuntu) | 22.04 |
| TeX Live | 2022 |

## Terms

- **TeX Live**：TeXとそれに関連するプログラムの包括的なディストリビューション。多くのTeXパッケージやLaTeXクラス、フォントなどを含む。

## VScodeでの使用
### 拡張機能の設定

VSCodeで書く場合には、ローカルの環境にRemote-Containersの拡張機能をインストールしてください。

# Usage
## リポジトリのクローン
以下のコマンドを実行して、このリポジトリのクローンを作成して下さい。
```bash
git clone https://github.com/Shuyawa89/latex-docker-env.git
```

## VSCodeでの使用
### Dev-Containersの設定
1. <a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers" target="_blank">こちらの拡張機能</a>をインストール


2. VSCodeの左下にある「><」をクリックし、「Remote-Containers: Open Folder in Container...」を選択

3. このリポジトリをcloneしたディレクトリを選択

これにより、VSCodeでLaTexの環境構築なしにtexで書くことができます。

### 基本的な使い方
1. workdirの中に.texファイルを作成する
2. 保存する

## Terminalでの実行

まず、Dockerfileがあるディレクトリで以下のコマンドを実行してDockerイメージをビルドします：

```bash
docker image build -f Dockerfile -t latex
```

### LaTeXファイルのコンパイル

Latexファイルをコンパイルするには以下のコマンドを実行します。
この例ではworkdir内に入っているsample.texをコンパイルします。

```bash
docker run --rm -v $PWD:/workdir latex pdflatex sample.tex
```

成功すれば、workdir内にPDFファイルが出力されます。

## Terminalの起動
ターミナルを起動したい場合は以下のコマンドを実行する
```bash
docker run --rm -v $PWD/workdir:/workdir -it latex
```
