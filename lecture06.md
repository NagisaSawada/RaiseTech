# 第六回授業課題

## AWSの利用記録をCloudTrailのイベント履歴から探し出す（IAMユーザー名のもの
### イベント名：CheckMfa
 ![event](/images/lecture06/event.png)
### 含まれている内容3つをピックアップ
  - eventTime:2024-06-19T08:04:572
  - eventSource:signin.amazonaws.com
  - eventName:CheckMfa
### イベントレコード
  ![eventrecord](/images/lecture06/eventrecord.png)

## CloudWatchアラームを使ってALBのアラームを設定しメール通知を確認
### SNSトピックとサブスクリプションの作成
  ![snstopic](/images/lecture06/snstopic.png)
### アラームとアクションを設定した状態で動作確認
  - Railsアプリケーションが使える状態の時：OK状態のメールが届く
  ![okmail](/images/lecture06/okmail.png)
  - アラームの状態
  ![okalarm](/images/lecture06/okalarm.png)
  - Railsアプリケーションが使えない状態の時：Alarm状態のメールが届く
  ![alarmmail](/images/lecture06/alarmmail.png)
  - アラームの状態
  ![alarm](/images/lecture06/alarm.png)

## 今日までに作成したAWSリソースの利用料の内容を見積もる（URLで共有）
 - 見積は[こちら](https://calculator.aws/#/estimate?id=13ddeefe958eb2374ec99b00ca7ca4861b4c57f2)

## 先月の請求情報からEC2の利用料金が無料利用枠で収まっているか確認
 - 先月の請求の概要
 ![bill](/images/lecture06/bill.png)
 - サービス別料金表から、EC2に"free tire"の表記があることを確認
 - EC2の使用は無料利用枠に収まっていると言える
 ![pricelist](/images/lecture06/pricelist.png)
 - グラフで確認
 ![feegraph](/images/lecture06/feegraph.png)

## 感想
 - システム稼働中のログを取ることが、会社や自分たちを守ることにつながるという重要性を学んだ。
 - コスト管理については、今後自分がAWSを使用していくうえでも、また、提案する立場になるとしても常に意識しなくてはいけないことだと感じた。
 - VPCの使用料が上がってしまっていた原因はパブリックIPv4アドレスの使用によるもので、これはVPCで起動されたリソースに関連付けられている為課金が発生する。

