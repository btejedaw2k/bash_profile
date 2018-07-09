require 'spec_helper'

describe 'bash_profile::config' do
  let(:title) { 'foo' }

  context 'with no parameters' do
    it { is_expected.to compile.and_raise_error(%r{There is not source to create bash profile[,] please insert a source}) }
  end
  context 'with source => /tmp/test' do
    let(:params) { { 'source' => '/tmp/test' } }

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

    it { is_expected. to contain_file('/etc/profile.d/foo').with(ensure: 'present', source: '/tmp/test') }
  end
  context 'with account => bar' do
    let(:params) { { 'source' => '/tmp/test', 'account' => 'bar' } }

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

    it { is_expected. to contain_file('/home/bar/foo').with(ensure: 'present', source: '/tmp/test') }
  end
  context 'with account_dir => /var/lib' do
    let(:params) { { 'source' => '/tmp/test', 'account_dir' => '/var/lib' } }

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

    it { is_expected. to contain_file('/var/lib/foo').with( ensure: 'present', source: '/tmp/test') }
  end
end