# learn-xv6-riscv

[MIT xv6-riscv](https://github.com/mit-pdos/xv6-riscv) を学習目的で fork したリポジトリ。  
M4 Mac / WSL2 上で Docker を使って xv6 をビルド・起動できるようにしてある。

> 元の MIT 公式 README は [`README`](./README) を参照（著者・謝辞・原ライセンス）。

## Quick Start

### 必要なもの

- Docker Desktop（Mac は VirtioFS 有効化推奨 / Windows は WSL2 + WSL Integration）
- Git

### ビルド & 起動

\`\`\`bash

# 1. イメージをビルド（初回 5〜10 分）

docker build -t xv6-dev .

# 2. xv6 をビルド & QEMU で起動

docker run --rm -it -v "$PWD":/work xv6-dev make qemu
\`\`\`

xv6 のシェル \`$\` が立ち上がれば成功。

\`\`\`text
xv6 kernel is booting

hart 1 starting
hart 2 starting
init: starting sh
$ ls
$ echo hello
\`\`\`

### 終了方法

\`\`\`text
Ctrl + a を押してから x
\`\`\`

\`Ctrl + C\` では抜けられないので注意。

### 2回目以降の起動

\`\`\`bash
docker run --rm -it -v "$PWD":/work xv6-dev make qemu
\`\`\`

## なぜ Docker を使うか

- Docker なら Mac / WSL2 / Linux で同じ手順で動かせる
- ホスト環境を汚さない

## ディレクトリ構成

\`\`\`text
learn-xv6-riscv/
├── Dockerfile # 学習用の最小ビルド環境
├── README.md # このファイル
├── README # MIT 公式の元 README（触らない）
├── LICENSE # MIT License（元のまま）
├── kernel/ # xv6 カーネル
├── user/ # ユーザープログラム
└── ...
\`\`\`

## ライセンス

本リポジトリは [xv6-riscv](https://github.com/mit-pdos/xv6-riscv) をベースとし、**MIT License** の下で配布される。  
詳細は [LICENSE](./LICENSE) を参照。元の著作権はすべて原著者（Russ Cox, Frans Kaashoek, Robert Morris ほか MIT PDOS）に帰属する。

## 参考

### 公式

- [**xv6-riscv 公式リポジトリ**](https://github.com/mit-pdos/xv6-riscv)  
  MIT PDOS による xv6（RISC-V版）のソースコード本体。本リポジトリの上流。
- [**xv6 Book (PDF, 英語, rev5 / 2025)**](https://pdos.csail.mit.edu/6.1810/2025/xv6/book-riscv-rev5.pdf)  
  xv6 の公式解説書。OS の主要概念（プロセス・ページング・割り込み・FS 等）をコードを題材に解説した約110ページの最新版。
- [**MIT 6.1810: Operating System Engineering**](https://pdos.csail.mit.edu/6.1810/)  
  xv6 を題材にした MIT の OS 講義（学部生向け）。講義ノート・スケジュール・Lab 課題が公開されており、自習可能。旧称は 6.S081（さらに前身は 6.828）。

### 日本語リソース

- [**xv6: シンプルで Unix 風な教育用オペレーティングシステム（日本語訳PDF）**](https://www.sugawara-lab.jp/fig/xv6-riscv-jpn.pdf)  
  xv6 Book の有志日本語訳（菅原研究室、2020年）。**ベースは英語原文 rev0 (2019)** なので最新の rev5 とは差分があるが、日本語で読める xv6 Book としては事実上の定番。
- [**OS in 1,000 Lines（日本語）**](https://operating-system-in-1000-lines.vercel.app/ja/)  
  xv6 と並ぶ教育用OS自作チュートリアル（nuta 著）。RISC-V ターゲットで、xv6 に入る前の慣らしにも良い。
- [**【OSに体感で入門する①】教育用OS xv6-riscvをQEMUで動かす（Qiita）**](https://qiita.com/hibi_ki/items/27f08216f6041409ea2b)  
  日本語の入門記事（2024年）。QEMU での起動手順を写経しやすい形でまとめている。
