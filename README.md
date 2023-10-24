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

### 既存のDocker環境を利用して新しいプロジェクトを開始

1. LaTeXのDocker環境をクローンする:
    ```bash
    git clone https://github.com/Shuyawa89/latex-docker-env.git my-latex-project
    cd my-latex-project
    ```

2. 新しいLaTeXファイルを作成:
    既存の`workdir`ディレクトリ内または新しくサブディレクトリを作成して、そこにLaTeXファイルを作成・編集します。

3. 新しいGitHubリポジトリを作成:
    GitHubのウェブインターフェースを使用して、新しいリポジトリを作成します。

4. ローカルのリポジトリを新しいGitHubリポジトリに接続:
    以下のコマンドでローカルのgitリポジトリを新しいGitHubのリポジトリに接続します。`[YourGitHubUsername]`と`[YourNewRepoName]`を適切なものに置き換えてください。
    ```bash
    git remote remove origin
    git remote add origin https://github.com/[YourGitHubUsername]/[YourNewRepoName].git
    ```

5. 変更をコミットし、新しいリポジトリにプッシュ:
    ```bash
    git add .
    git commit -m "Initial commit with my new LaTeX project."
    git push -u origin master
    ```

6. VSCodeでの作業:
    必要に応じてVSCodeでプロジェクトディレクトリを開き、Remote-Containersの拡張機能でDocker環境に接続して作業します。

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
