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


















