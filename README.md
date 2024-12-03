# 42Proj-template

## Description
以下のことが可能
- devcontainerを用いた開発環境
	- norminetteの使用
	- 各種manの閲覧
	- 各種linuxコマンドの実行
	- mlx, readline関数の使用
		- mlxに関してはdevcontainerにインストール済みだが、Make実行時にmlxをインストールするスクリプトを記述している。
	- [`francinette`](https://github.com/xicodomingues/francinette)コマンドの使用

- c++開発
	- clang++ を使用したコンパイル
	- clang-formatコマンドの使用
	- clang-tidyコマンドの使用

- minilibXを使用するプロジェクトでのパターンの例を記載

- [ ] 課題提出前に、不要なファイル削除を忘れない

## Usage
### 前提
- Windows OS
- [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)
- Dockerがインストールされている
- Visual Studio Codeがインストールされている
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)拡張機能がインストールされている

## 手順
1. このリポジトリをクローンする
2. Visual Studio Codeでこのリポジトリを開く
3. [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)を起動
4. 左下の「><」をクリックし、`Reopen in Container`を選択する
5. コンテナが起動するのを待つ
6. `.devcontainer/devcontainer.json`の`42header.email`と`42header.username`を適宜設定
7. 作業を開始する

## 参考
https://code.visualstudio.com/docs/devcontainers/containers

## Author
- GawinGowin-[GitHub](https://github.com/GawinGowin)
