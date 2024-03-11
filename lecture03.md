# 第三回授業課題
## APサーバーについて
 - サンプルAP接続確認画面
 ![サンプルAP](/images/sampleapconnection.png)
 - APサーバーの名前：Puma、バージョン：5.6.8
 ![APサーバー](/images/apserver.png)
 - APサーバーを終了させるとアクセスできなくなったが、再度APサーバーを起動するとアクセス可能になった
 ![アクセス不可](/images/apserverstop.png)
 
 ## DBサーバーについて
 - サンプルAPで使用したDBサーバーの名前：MySQL、バージョン：8.0.36
 ![DBサーバー](/images/dbserver.png)
 - DBサーバーを終了させるとアクセスできなくなった
 ![DBサーバー停止](/images/dbserverstop.png)
 - Railsの構成管理ツールの名前：Bundler
 
## 学んだこと
 - WebAPとは、Webブラウザとインターネットさえあれば利用できるAPのこと
 - WebサイトとWebAPの違いは、基本的にリロードしても同じ情報表示のものはWebサイトで、動的な処理を行うものがWebAP
 - 通信はクライアントとサーバー間のリクエストとレスポンスから成り立つものでリクエスト送る際に行いたい処理を伝えるのに”HTTPメソッド”を使用する
 - システム開発は一定の成果が得られるようにW字・V字モデルやウォーターフォール・アジャイル・スクラムスクラム等のある程度定まった方式を活用することが多い
 - RubyonRailsはRuby言語を使用したフレームワークのこと
 - gemとはライブラリをパッケージ化したもので、bundlerとはプロジェクトで使用するgemを束ねてどのgemのどのバージョンが必要か掲示する仕組みのこと
 - DBとは整理された情報の集まりで、今回使用したのがMySQL
 
## 感じたこと
 - コンピューター上にプログラムをインストールするという工程が必要だったAPが今では様々なツールがWebAPとして使用されていて、技術の進化を感じた
 - 実際にサンプルAP入手からDBセットアップを通して接続を行い一連の流れを体感できた
 - デプロイまでに使用したコマンドは初見のものが多かった為その都度意味を調べつつ進めたら現状を俯瞰して捉えられたと思う
 - コマンドは種類が多い為使用するものはメモしておき、無理に覚えるのではなく初見のものはその都度調べるスタンスでいくのがいいかなと思う