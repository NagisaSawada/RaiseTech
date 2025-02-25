# RaiseTech Challenge:インフラ自動化＆自動デプロイへの挑戦
**本課題は、最新のクラウド技術と自動化ツールを駆使して、Railsアプリケーションのインフラ構築および自動デプロイを実現する実践的な課題です。  
こちらのリポジトリを、学習した内容の振り返りとともにまとめる場として利用していきます。**   
※なお、Ansibleによる自動化の最終課題は現在進行中です。
## 目次  
   [使用技術一覧](#使用技術一覧)  
   [現在取組中のインフラ構成図と概要](#現在取組中のインフラ構成図と概要)  
   [Railsアプリケーションの動作環境](#railsアプリケーションの動作環境)  
   [学習内容](#学習内容)  

### **使用技術一覧**

<p style="display: inline">
  <!-- Webアプリケーションフレームワーク -->
  <img src="https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000.svg?style=for-the-badge&logo=rubyonrails&logoColor=white">
  
  <!-- アプリケーションサーバー -->
  <img src="https://img.shields.io/badge/-Puma-5a2d81.svg?style=for-the-badge">
  
  <!-- Webサーバー -->
  <img src="https://img.shields.io/badge/-Nginx-269539.svg?logo=nginx&style=for-the-badge">
  
  <!-- データベース -->
  <img src="https://img.shields.io/badge/-MySQL-4479A1.svg?logo=mysql&style=for-the-badge&logoColor=white">
  
  <!-- クラウドプラットフォーム -->
  <img src="https://img.shields.io/badge/-Amazon%20AWS-232F3E.svg?logo=amazon-aws&style=for-the-badge">
  
  <!-- インフラ自動化（CloudFormation） -->
  <img src="https://img.shields.io/badge/-CloudFormation-146EB4.svg?style=for-the-badge&logo=amazon-aws&logoColor=white">
  
  <!-- サーバ構成管理 -->
  <img src="https://img.shields.io/badge/-Ansible-EE0000.svg?style=for-the-badge&logo=ansible&logoColor=white">
  
  <!-- CI/CDパイプライン -->
  <img src="https://img.shields.io/badge/-CircleCI-343434.svg?style=for-the-badge&logo=circleci&logoColor=white">
  
  <!-- デプロイ後テスト -->
  <img src="https://img.shields.io/badge/-ServerSpec-2C3E50.svg?style=for-the-badge">
  
  <!-- バージョン管理 -->
  <img src="https://img.shields.io/badge/-Git-F05032.svg?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/-GitHub-181717.svg?style=for-the-badge&logo=github&logoColor=white">
</p>

### **現在取組中のインフラ構成図と概要**  
 - 構成図  
![configuration-diagram](/images/README/total-configuration-diagram.png)  
 - 概要  
 1. AWSインフラの自動構築:  
    CloudFormation を用いて、VPC、EC2、RDS、ALB、S3 など、必要なAWSリソースを自動でプロビジョニングします。  
 2. サーバー環境構築とRailsアプリケーションのデプロイ:  
    Ansible により、Railsアプリケーションを実行するための環境を自動構築します。  
 3. 自動テスト:  
    ServerSpec を使用して、構築されたサーバー環境が正しく動作しているかを自動テストします。
### **Railsアプリケーションの動作環境**  
[使用したRailsサンプルアプリケーションはこちら](https://github.com/yuta-ushijima/raisetech-live8-sample-app)  
ruby
```
3.2.3
```
Bundler
```
2.3.14
```
Rails
```
7.1.3.2
```
Node
```
v17.9.1
```
yarn
```
1.22.19
```
### **学習内容**
| 講義番号 | 学習テーマ | 課題内容 | 提出物 |
| ------- | ------- | ------- | ------- |
| 1 | ・インフラエンジニアへの理解 <br> ・AWSとは | ・AWSアカウントの作成 <br> ・IAMの推奨設定 <br> ・Cloud9を作成しRubyで`HelloWorld`を出力 | Discord上でキャプチャ提出 |
| 2 | ・Gitとは <br> ・Markdownについて <br> | ・Githubアカウント、課題用リポジトリを作成 <br> ・Cloud9のGit設定変更 <br> ・`main`ブランチにブランチ保護ルールを付ける <br> ・授業の感想をMarkdownで表しプルリクエストを作成する | [lecture02.md](/lecture02.md) |
| 3 | ・Webアプリケーションとは <br> ・システム開発の流れ <br> ・外部ライブラリと構成管理の重要性 | ・Cloud9でサンプルアプリケーションのデプロイ <br> ・使用しているAPサーバー、DBサーバーを調べる | [lecture03.md](/lecture03.md) |
| 4 | ・AWS環境の完成イメージ <br> ・AWSでの権限管理 <br> ・AWSリソースの作成 | ・AWS上にVPC、EC2、RDSの作成 <br> ・EC2からRDSへの接続確認 | [lecture04.md](/lecture04.md) |
| 5 | ・EC2にサンプルアプリケーションをデプロイ <br> ・ELBを用いた負荷分散 <br> ・S3の役割 | ・EC2にサンプルアプリケーションをデプロイ <br> ・ALBを加えて冗長化してデプロイ <br> ・S3に画像の保存先を変更 <br> ・構成図の作成 | [lecture05.md](/lecture05.md) |
| 6 | ・AWSにおけるロギングツール、監視・通知ツール、 <br> コスト管理ツール | ・CloudTrailのイベントの確認 <br> ・CloudWatchアラームを使いALBのアラーム設定をしメール通知する（OKアクションを設定） <br> ・AWS利用料を見積もる | [lecture06.md](/lecture06.md) |
| 7 | ・システムにおけるセキュリティの基礎 <br> （脆弱性、認証情報の流失、人為的な過負荷） | ・現在の構成の脆弱さを考えその対策をまとめる | [lecture07.md](/lecture07.md) |
| 8 | 第五回環境構築の実演 | なし | なし |
| 9 | 第五回環境構築の実演 | なし | なし |
| 10 | ・インフラの自動化 <br> CloudFormationについて | ・現在までの環境をCloudFormationでコード化し、構築確認する | [lecture10.md](/lecture10.md) |
| 11 | ・インフラのコード化を支援するツールについて <br> ・インフラのテストとは <br> ・ServerSpecについて | ・ServerSpecのテストを実行する | [lecture11.md](/lecture11.md) | 
| 12 | ・Terraformについて <br> ・DevOpsとは <br> ・CI/CDツールとは | ・CircleCiを導入し提供されたサンプルコンフィグがただしく動作するか確認する | [lecture12.md](/lecture12.md) |
| 13 | ・構成管理ツールとは <br> ・Ansibleについて <br> ・OpsWorksについて <br> ・CircleCiとの併用 | ・CircleCiでCloudFormation、Ansible、ServerSpecを自動で実行させる | 以降取組中 | 
| 14 | 第十三回環境構築の実演 | なし | なし | 
| 15 | 第十三回環境構築の実演 | なし | なし |
| 16 | ・現場へ出ていくにあたって必要な技術と知識 <br> ・現場での立ち振る舞い <br> ・就職、転職で優位に立つために | なし | なし | 

