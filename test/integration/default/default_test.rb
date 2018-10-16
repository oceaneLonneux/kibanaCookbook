# # encoding: utf-8

# Inspec test for recipe kibana::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe package("openjdk-8-jdk") do
  it { should be_installed }
  its('version') { should match '8u181-b13-0ubuntu0.16.04.1'  }
end

describe package("kibana") do
  it { should be_installed }
  its('version') { should match '6.4.0'  }
end

# service enable
describe service "kibana" do
  it { should be_enabled }
  it { should be_started }
end

describe package("apt-transport-https") do
  it { should be_installed}
end

describe bash("wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -") do
  its('exit_status') { should eq 0 }
end
