#
# Cookbook:: kibana
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'kibana::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it "should install transport" do
      expect(chef_run).to install_package("apt-transport-https")
    end
    it "should install kibana" do
      expect(chef_run).to install_package("kibana")
    end
    it "should install openjdk-8-jdk" do
      expect(chef_run).to install_package("openjdk-8-jdk")
    end
    it "should update sources" do
      expect(chef_run).to update_apt_update("update_sources")
    end
    it "should enable kibana" do
      expect(chef_run).to enable_service("kibana")
      expect(chef_run).to start_service("kibana")
    end
    it 'should run bash to wget the key for elastic stack' do
      expect(chef_run).to add_apt_repository('information-keys')
    end
    it "should add bash https" do
      expect(chef_run).to run_bash('add-bash-https')
    end
    it "should create a kibana.yml in /etc/kibana/kibana.yml" do
      expect(chef_run).to create_template("/etc/kibana/kibana.yml")
    end

  end
end
