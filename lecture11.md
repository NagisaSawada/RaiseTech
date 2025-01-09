# 第十一回授業課題

## 第五回で構築した環境にSrverspecを導入しテストを行う

### Serverspecインストール
#### 以下のいずれかの方法でインストール可能
 - 方法①：以下のコマンドを実行する
   ```
   $ sudo gem install serverspec
   ```
 - 方法②：Gemfileを編集し、bundlerでインストール  
Gemfileに以下の記述を追記する
   ```
   gem 'serverspec'
   ```  
以下のコマンドを実行する
   ```
   $ bundle
   ```

#### 正常にインストール完了したかどうかの判断方法
 - 以下のコマンドを実行する
   ```
   $ gem list
   ```
 - 期待する実行結果
   ```
   serverspec (2.42.3)
   ```

### 新規作業用ディレクトリ上でスタートコマンドを実行
   ```
   $ serverspec-init 
   # 下記が出力されるので対話形式で入力する
   Select OS type:

     1) UN*X
     2) Windows

   Select number: 1 # EC2なので1を選択

   Select a backend type:

     1) SSH
     2) Exec (local)

   Select number: 2　# ローカルで実行するので2を選択
   # 以下ファイルができる
    + spec/
    + spec/localhost/
    + spec/localhost/sample_spec.rb
    + spec/spec_helper.rb
    + Rakefile
    + .rspec
   ```

### sample_spec.rbを編集して自分なりのテストを作成
   ```
   require 'spec_helper'

   # ポート指定
   listen_port_ssh = 22
   listen_port_http = 80

   # パッケージがインストールされているか確認する
   describe package('git') do
     it { should be_installed }
   end

   # gemとして指定のバージョンがインストールされているか確認する
   describe package('bundler') do
     it { should be_installed.by('gem').with_version('2.3.14') }
   end

   # コマンドの標準出力から指定のバージョンがインストールされているか確認する
   describe command('ruby -v') do
     its(:stdout) { should match /ruby 3\.2\.3/ }
   end

   # Nginxがインストール済であること
   describe package('nginx') do
     it { should be_installed }
   end

   # 指定のポート（22番・80番）がリッスン（通信待ち受け状態）であること
   describe port(listen_port_ssh) do
     it { should be_listening }
   end

   describe port(listen_port_http) do
     it { should be_listening }
   end

   # curlでHTTPアクセスをして200番を返す動作を確認
   describe command('curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
     its(:stdout) { should match /^200$/ }
   end

   # ディレクトリの存在/ディレクトリであるかの確認
   describe file('/home/ec2-user/RaiseTech/lecture11-sub/serverspec-test') do
     it { should exist }
     it { should be_directory }
   end

   # ファイルの存在/ファイルであるか/'listen_port'文字列が含まれているかの確認
   describe file('/home/ec2-user/RaiseTech/lecture11-sub/serverspec-test/spec/localhost/sample_spec.rb') do
     it { should exist }
     it { should be_file }
     it { should contain 'listen_port' }
   end
   ```

### テスト開始コマンドを実行
   ```
   $ rake spec
   ```

### 実行結果
 ![successfultests1](/images/lecture11/successfultests1.png)
 ![successfultests2](/images/lecture11/successfultests2.png)

## 感想
 - 一回目のテストはHTTPアクセスのレスポンスコードが502番で失敗した。原因はただDBを起動していなかっただけだったが、それを知る為のテストだと思うと楽しかった。
 - 今回は公式サイトやその他技術ブログを参考にテストを作成したが、RSpecの知識を深めたらより細かなテストが行えそうなので興味がわいた。

