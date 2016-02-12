require 'spec_helper'
require "radio3/r3_client"

describe Radio3 do
  it 'has a version number' do
    expect(Radio3::VERSION).not_to be nil
  end

  it 'it should return a program list' do
    expect(R3Client.new.get_programs(1)).to_not be_nil
  end

  it 'it should return a program list' do
    expect(R3Client.new.get_audios(1875)).to_not be_nil
  end

end
