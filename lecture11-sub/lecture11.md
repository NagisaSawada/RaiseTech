# 第十一回授業課題

## 第五回で構築した環境をServerspecでテストし、成功することを確認する

### Serverspecのインストール
 - gemで公開されているので下記コマンドでインストール可能
   ```
   $ sudo gem install serverspec
   ```
 - もしくはアプリケーションのGemfileに下の行を追加する
   ```
   gem 'serverspec'
   # 行追加後、下記を実行
   $ bundle
   ```
 - インストール確認
   ```
   $ gem list
   # Serverspecがインストールされたことを確認できた
   serverspec (2.42.3)

### 新規ディレクトリ上でスタートコマンドを実行
   ```
   $ serverspec-init 
   ```
 - 下記が出力されるので対話形式で入力
   ```
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
### sample_spec.rbファイルを編集して自分なりにテストを作成
   ```
   require 'spec_helper'

   # ポート指定
   listen_port1 = 22
   listen_port2 = 80

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
   describe port(listen_port1) do
     it { should be_listening }
   end

   describe port(listen_port2) do
     it { should be_listening }
   end

   # Nginxがインストール済であること
   describe package('nginx') do
     it { should be_installed }
   end

   # 指定のポート（22番・80番）がリッスン（通信待ち受け状態）であること
   describe port(listen_port1) do
     it { should be_listening }
   end

   describe port(listen_port2) do
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

### テストの実行
   ```
   $ rake spec
   ```

### 実行結果（テスト成功）
 ![]()
 ![]()

## 感想
 - 一回目のテストはHTTPアクセスをして502番が返ってきて失敗した。原因はただDBを起動していなかっただけだったが、これを知る為のテストなのだと分かり楽しくなった。
 - 今回は公式サイトやその他技術ブログを参考にしたが、RSpecの知識を深めたらより細かいテストが行えると思い、興味がわいた。

