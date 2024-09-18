# 第十回授業課題

## CloudFormationを利用して現在までに作った環境をコード化する
## コード化ができたら実行してみて、環境が自動で作られることを確認する

### 今回構築した環境
![configurationdiagram10](/images/lecture10/configurationdiagram10.png)

| 構築したもの | 作成したテンプレートファイル |
| ---- | ---- |
| VPC | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| サブネット | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| インターネットゲートウェイ | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| VPCGatewayAttachment | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| ルートテーブル | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| サブネットとルートテーブルの関連付け | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| インターネットゲートウェイとルートテーブルの関連付け | [lecture10-cf-vpc.yml](/lecture10-sub/lecture10-cf-vpc.yml) |
| セキュリティグループ | [lecture10-cf-sg.yml](/lecture10-sub/lecture10-cf-sg.yml) |
| S3バケット | [lecture10-cf-s3.yml](/lecture10-sub/lecture10-cf-s3.yml) |
| IAMロールの定義 | [lecture10-cf-s3.yml](/lecture10-sub/lecture10-cf-s3.yml) |
| IAMインスタンスプロファイルの定義 | [lecture10-cf-s3.yml](/lecture10-sub/lecture10-cf-s3.yml) |
| EC2インスタンス | [lecture10-cf-ec2.yml](/lecture10-sub/lecture10-cf-ec2.yml) |
| RDSインスタンス | [lecture10-cf-rds.yml](/lecture10-sub/lecture10-cf-rds.yml) |
| RDSのサブネットグループ | [lecture10-cf-rds.yml](/lecture10-sub/lecture10-cf-rds.yml) || ALBのターゲットグループ | [lecture10-cf-alb.yml](/lecture10-sub/lecture10-cf-alb.yml) |
| ALB | [lecture10-cf-alb.yml](/lecture10-sub/lecture10-cf-alb.yml) |
| ALBのHTTPリスナー | [lecture10-cf-alb.yml](/lecture10-sub/lecture10-cf-alb.yml) |

### 構築した環境のエビデンス画像
  - VPCスタック作成
  ![createVPC](/images/lecture10/createVPC.png)
  ![VPCdetails](/images/lecture10/VPCdetails.png)
  ![VPCresourcemap](/images/lecture10/VPCresourcemap.png)
  - EC2スタック作成
  ![createEC2](/images/lecture10/createEC2.png)
  ![EC2details](/images/lecture10/EC2details.png)
  ![EC2details2](/images/lecture10/EC2details2.png)
  - EC2のセキュリティグループ
  ![EC2SG](/images/lecture10/EC2SG.png)
  - ALBスタック作成
  ![createALB](/images/lecture10/createALB.png)
  ![ALBdetails](/images/lecture10/ALBdetails.png)
  ![ALBlistener](/images/lecture10/ALBlistener.png)
  ![ALBtargetgroup](/images/lecture10/ALBtargetgroup.png)
  - ALBのセキュリティグループ
  ![ALBSG1](/images/lecture10/ALBSG1.png)
  ![ALBSG2](/images/lecture10/ALBSG2.png)
  - RDSスタック作成
  ![createRDS](/images/lecture10/createRDS.png)
  ![RDSdetails](/images/lecture10/RDSdetails.png)
  - RDSのセキュリティグループ
  ![RDSSG1](/images/lecture10/RDSSG1.png)
  ![RDSSG2](/images/lecture10/RDSSG2.png)
  - S3スタック作成
  ![createS3](/images/lecture10/createS3.png)
  ![S3details1](/images/lecture10/S3details1.png)
  ![S3details2](/images/lecture10/S3details2.png)

### EC2へSSH接続確認
  ![SSHconnection](/images/lecture10/SSHconnection.png)
### EC2からRDSへ接続確認
  ![EC2toRDS2](/images/lecture10/EC2toRDS2.png)

### 感想
 - 最初は各行が何を表すものなのか理解するまで時間がかかったが、分かると面白かった。
 - 変更の記録やバージョン管理も簡単に行えて要所要所でリソースを作成・削除することもでき結果的にランニングコストを下げることに繋がる、魅力あふれるサービスだと気付けた。
 -  第五回で環境構築した時はウィザード経由で良く分からずハンズオンしていた為、今回は一つ一つ調べながら進められて良い学習になったと思う。


