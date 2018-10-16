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

4. Do pipelines.


**If you have converge problem : delete the .kitchen file, delete vm then restart.**

Oceane
