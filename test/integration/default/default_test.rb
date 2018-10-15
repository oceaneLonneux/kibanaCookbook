# # encoding: utf-8

# Inspec test for recipe kibana::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.

# describe port(80), :skip do
#   it { should_not be_listening }
# end


describe package("openjdk-8-jdk") do
  it { should be_installed }
  its('version') { should match '8u181-b13-0ubuntu0.16.04.1'  }
end
