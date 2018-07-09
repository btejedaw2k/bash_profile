require 'spec_helper'

describe 'bash_profile::config' do
  context "no parameters" do
    let(:title) { 'foo' }

    it { is_expected.to compile.and_raise_error(%r{There is not source to create bash profile[,] please insert a source}) }
  end
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:title) { 'foo' }
      let(:facts) { os_facts }
      let(:params) { { 'source' => '/tmp/test'} }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }
    end
  end
end
