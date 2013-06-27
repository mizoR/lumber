# -*- coding: utf-8 -*-

describe Macaroni::Plugin::Output::Stdout do
  it do
    begin
      stdout = $stdout
      $stdout = StringIO.new
      stdout_output = described_class.new
      stdout_output.exec 'TEST'
      expect($stdout.string).to eq "TEST\n"
    ensure
      $stdout = stdout
    end
  end
end

