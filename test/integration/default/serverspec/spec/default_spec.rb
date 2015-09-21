require 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8000) do
  it { should be_listening}
end

describe command('wget localhost:8000 && cat index.html') do
  its(:stdout) { should contain ('Basic webpage for PSE Exercise') }
end
