# LaTeX Docker Environment

## Overview
このリポジトリは、TeX Liveとlatexindentを使用したLaTeX環境をDocker上に構築するためのものです。
Latexで作成されたファイルをDockerイメージ上でコンパイルすることができます。
新しい環境を作るときでも、一度Dockerfileをbuildするとすぐに使用できるようになります。

## Environment

| Software | Version |
| -------- | ------- |
| OS (Ubuntu) | 22.04 |
| TeX Live | 2022 |

## Terms

- **TeX Live**：TeXとそれに関連するプログラムの包括的なディストリビューション。多くのTeXパッケージやLaTeXクラス、フォントなどを含む。
- **latexindent**：LaTeXファイルのインデント（字下げ）を自動的に整形するためのPerlスクリプト。



## Usage

### Dockerイメージのビルド

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