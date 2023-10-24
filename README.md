# LaTeX Docker Environment

## 概要
このリポジトリは、TeX Liveを使用したLaTeX環境をDocker上で構築するためのものです。VSCodeの拡張機能とともに、環境構築なしでLaTeXを使用できます。VSCodeを利用しない場合でも、Dockerイメージ上でLaTeXファイルをコンパイル可能です。

## 使用環境

- **OS (Ubuntu):** 22.04
- **TeX Live:** 2022

## 用語

- **TeX Live:** TeXやLaTeXを利用するためのプログラムやパッケージを集めたディストリビューション。

## VSCodeでの使用

### 必要な拡張機能
- Remote-Containers
- LaTeX Workshop

### Dev-Containersの設定
1. [Remote-Containers拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)をインストールします。
2. VSCodeの左下の「><」アイコンをクリックし、「Remote-Containers: Open Folder in Container...」を選択。
3. このリポジトリをcloneしたディレクトリを選択します。

### LaTeXのコンパイル設定について
VSCodeのLaTeX Workshop拡張機能の設定で、`latex-workshop.autoBuild.run`を`onSave`にしている場合、TeXファイルを保存するたびに自動的にコンパイルが行われます。

#### 参考文献の有無でのコンパイルの切り替え方法:
`devcontainer.json`の`"latex-workshop.latex.recipe.default": "first"`を任意のrecipe名に書き換えて下さい。

この切り替えは、VSCodeの設定や、各TeXファイルのヘッダーに特定の設定を書くことで行えます。

## Terminalでの使用方法

### Dockerイメージのビルド
```bash
docker image build -f Dockerfile -t latex
```

### LaTeXファイルのコンパイル
```bash
docker run --rm -v $PWD:/workdir latex pdflatex sample.tex
```

### ターミナルの起動
```bash
docker run --rm -v $PWD/workdir:/workdir -it latex
```
