# kibana

1. Dont forget to change to solorunner, in default spec.
⋅⋅⋅ Complete the spec_helper.⋅⋅
... in .kitchen.yml :⋅⋅

```platforms:
  - name: ubuntu-16.04
    driver:
      box: ubuntu/xenial64
```

2. Kibana needs Java to work. We choose the 8th version as to avoid any bugs.
This is a bit of a tricky part, here is the configuration :
in default.rb
```package "openjdk-8-jdk" do
  action :install
end
# the package for java 8
```
in default test
```describe package("openjdk-8-jdk") do
  it { should be_installed }
  its('version') { should match '8u181-b13-0ubuntu0.16.04.1'  }
end
```
in default spec
```it "should install openjdk-8-jdk" do
  expect(chef_run).to install_package("openjdk-8-jdk")
end
```

3. Establish tests.

4. Do the CI pipeline :
```+ chef exec rspec spec

kibana::default
  When all attributes are default, on Ubuntu 16.04
    converges successfully
    should install transport
    should install kibana
    should install openjdk-8-jdk
    should update sources
    should enable kibana
    should run bash to wget the key for elastic stack
    should add bash https
    should create a kibana.yml in /etc/kibana/kibana.yml

Finished in 0.35207 seconds (files took 1.65 seconds to load)
9 examples, 0 failures


ChefSpec Coverage report generated...

  Total Resources:   8
  Touched Resources: 8
  Touch Coverage:    100.0%

You are awesome and so is your test coverage! Have a fantastic day!
```

5. Do the packer pipeline.

```
  System Package openjdk-8-jdk
[38;5;41m     ✔  should be installed[0m
[38;5;41m     ✔  version should match "8u181-b13-0ubuntu0.16.04.1"[0m
  System Package kibana
[38;5;41m     ✔  should be installed[0m
[38;5;41m     ✔  version should match /6.4\./[0m
  Service kibana
[38;5;41m     ✔  should be enabled[0m
[38;5;41m     ✔  should be running[0m
  System Package apt-transport-https
[38;5;41m     ✔  should be installed[0m
  Bash command wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
[38;5;41m     ✔  exit_status should eq 0[0m

```

**If you have converge problem : delete the .kitchen file, delete vm then restart.**

Oceane
