# 第四回授業課題

## VPC、サブネット構築
 - ウィザード経由でVPC内にサブネット（パブリック×2、プライベート×2）とIGWを作成
 ![VPC](/images/lecture04/raisetech-vpc.png)

## EC2インスタンスの作成
 - ウィザード経由で作成
 - セキュリティーグループとキーペア作成
 ![EC2](/images/lecture04/construct-EC2.png)
 ![EC2-SG](images/lecture04/EC2-SG.png)
 ![EC2-keypair](images/lecture04/EC2-keypair.png)

## RDSの作成
 - プライベートサブネットにMySQLのDBを作成しセキュリティグループも作成
 ![RDS1](images/lecture04/construct-rds1.png)
 ![RDS2](images/lecture04/construct-rds2.png)

## EC2からRDSへの接続確認
 ![EC2toRDS](images/lecture04/EC2toRDS.png)


