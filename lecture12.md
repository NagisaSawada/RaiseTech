# 第十二回授業課題
## CircleCiを導入し、[提供されたサンプルコンフィグ](https://github.com/MasatoshiMizumoto/raisetech_documents/tree/main/aws/samples/circleci)が動作するか確認する  
### 事前準備
 - CircleCiとGithubを連携させる（[CircleCiスタートガイド](https://circleci.com/docs/ja/getting-started/)に沿って設定）  
 - [デプロイキーとユーザーキーの設定](https://circleci.com/docs/ja/github-integration/#connect-a-github-account)
   <details><summary>詳細</summary>  
   
   1. [ローカルPCでSSHアクセスキーを作成](https://circleci.com/docs/ja/github-integration/#deploy-keys-and-user-keys)    
      ```
      $ ssh-keygen -t ed25519 -C "your_email@example.com"
      ```
   2. `https://github.com/you/test-repo/settings/keys`に移動して1.で作成したパブリックキーを貼り付けデプロイキーを追加する  
   （Allow write access はオンに設定）  
   3. CircleCIのプロジェクト設定にて1.で作成したプライベートキーを貼り付けSSHキーを追加する

   </details>  
### 実践
 - `/.circleci`に`config.yml`を作成  
   ```
   version: 2.1
   orbs:
     python: circleci/python@2.0.3
   jobs:
     cfn-lint:
       executor: python/default
       steps:
         - checkout
         - run: pip install cfn-lint
         - run:
             name: run cfn-lint
             command: |
               cfn-lint -i W3002 -t lecture10-sub/*.yml

   workflows:
      raisetech:
       jobs:
         - cfn-lint
   ```  
 - [CircleCIのローカルCLIのインストール](https://circleci.com/docs/ja/local-cli/)  
   ```
   $ curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash  
   # CircleCIのCLIツールはデフォルトで`/usr/local/bin`ディレクトリにインストールされる  
   # /usr/local/binへの書き込みアクセス権を持っていない場合は、上記コマンドのパイプとbashの間にsudoを挿入して実行
   ```
 - CLIの設定  
   ※CLIを使用する前にCircleCiの[APIトークンを生成する](https://app.circleci.com/settings/user/tokens)  
   トークンを取得したら以下を実行してCLIを設定  
   ```
   $ circleci setup
   ```  
   先ほど生成したトークンを貼り付けて完了  
![circleci-api-token](/images/lecture12/circleci-api-token.png)
 - CLIを使いバリデーションを行う  
   `.circleci/config.yml`ファイルがあるディレクトリに移動し、以下を実行  
   ```
   $ circleci config validate
   ```  
   以下が表示され検証は成功  
   ```
   Config file at .circleci/config.yml is valid.
   ```  
### 動作確認  
 - Githubにpushすると以下の警告が確認できる  
![test-failure](/images/lecture12/test-failure.png)  

   | 警告コード | 警告内容 | 修正点 | 修正後コード |
   | --------- | --------- | --------- | --------- |
   | W2506 | cfn-lintの指定するAMIの型は`AWS::EC2::Image::Id`または <br> `AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>` <br> である必要がある | 型を `AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>`  <br> に変更する | [lecture10-cf-ec2.yml](/lecture10-sub/lecture10-cf-ec2.yml) |
   | W3010 | リージョンのハードコードにより柔軟性が失われている | AZを動的に取得する方法として <br> 組み込み関数`Fn::GetAZs`を使用する | [lecture10-cf-rds.yml](/lecture10-sub/lecture10-cf-rds.yml) |
   | W1011 | テンプレートで機密情報を通常のパラメータとして渡しているため <br> 動的参照を利用した方が安全 | [SecretsManagerの動的参照を使用する記述](https://zenn.dev/devcamp/articles/54ffd860025f64)に改善 <br> `ManageMasterUserPassword: true`こちらの記載に変更 | [lecture10-cf-rds.yml](/lecture10-sub/lecture10-cf-rds.yml) |
   | W3045 | S3バケットに対するアクセス制御は`AccessControl`プロパティより <br> 柔軟で詳細な制御が可能な <br> `AWS::S3::BucketPolicy`リソースを推奨 | 既に`S3BucketPolicy`を定義しており <br> `AccessControl: Private`の記載は冗長になる為削除 | [lecture10-cf-s3.yml](/lecture10-sub/lecture10-cf-s3.yml) |
 - 再度pushして成功確認  
![test-success](/images/lecture12/test-success.png)
## 感想
 - CircleCiのサンプルコンフィグの意味を理解し、またCircleCiがどのタイミングでテストを実行するのかハンズオンを通して体感した。
 - 高速でコード解析等の作業を継続的に実行してくれる素晴らしいツールだと実感できた。
 
