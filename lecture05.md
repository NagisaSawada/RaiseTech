# 第五回授業課題

## EC2上でサンプルアプリケーションのデプロイ、動作確認
### 1.組み込みサーバー（Puma）での動作確認
  - Pumaをsystemdで起動
  ![puma-deploy](/images/lecture05/puma-deploy.png)

### 2.組み込みサーバーとUnixSocketを使った動作確認
  ![puma-unixsocket](/images/lecture05/puma-unixsocket.png)

### 3.Nginxの単体起動確認
  ![nginx](/images/lecture05/nginx.png)

### 4.Nginxと組み込みサーバー、UnixSocketを組み合わせての動作確認
  ![puma-unixsocket-nginx](/images/lecture05/puma-unixsocket-nginx.png)

### 5.ELB（ALB）を追加して動作確認
  - ALBを作成
  ![create-alb](/images/lecture05/create-alb.png)
  - ALBのターゲットグループへのヘルスステータス
  ![targetgroup](/images/lecture05/targetgroup.png)
  - ALBのDNS名で動作確認
  ![ALB-DNS](/images/lecture05/ALB-DNS.png)

### 6.S3を追加して画像の保存先として活用
  - S3を作成
  ![create-S3](/images/lecture05/create-S3.png)
  - EC2に対してS3への権限を付与する為IAMロールの作成（AmazonS3FullAcces付与）
  ![iamrole1](/images/lecture05/iamrole1.png)
  - EC2にIAMロールをアタッチ
  ![iamrole2](/images/lecture05/iamrole2.png)
  - S3に画像を保存
  ![s3-picture-save1](/images/lecture05/s3-picture-save1.png)
  - S3内のオブジェクトとして画像があることを確認
  ![s3-picture-save2](/images/lecture05/s3-picture-save2.png)

## 構成図の作成
  ![configuration-diagram](/images/lecture05/configuration-diagram.png)
  - 構成図を修正（2024/06/15）
  ![configuration-diagram2](/images/lecture05/configuration-diagram2.png)

## 感想
 - 接続させるにあたり、サーバーの設定ファイルやアプリケーションファイルに修正や追加をしたりする根本的な部分が難しかった。
 - 検索して技術ブログを参考にすることが多かったが、公式ドキュメントを読み解く力もつけていかなくてはならないと痛感した。
 - 今回アプリケーションのブラウザでの動作確認時に画像が表示されない件で長時間悩んだ。結果、rails7以降はImageMagicを使う為に明示的にファイルへ記さなければならないと学んだ。
 - 常に最先端の情報を入手する力をつけるとともに、質問力も鍛えていかなくてはならないと実感した回だった。
