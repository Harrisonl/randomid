require 'spec_helper'

describe Randomid do

  it 'has a version number' do
    expect(Randomid::VERSION).not_to be nil
  end

  it 'it sets the uid for the model passed in' do
    uid = Randomid.generate_uid(16)
    expect(uid).not_to be nil
  end

  it "if a length is passed in, it uses that length" do
    uid = Randomid.generate_uid(16)
    expect(uid.length).to eq(16)
  end

  it "should be URLSAFE" do
    uid = Randomid.generate_uid(16)
    expect(uid).to match(/^[a-zA-Z0-9_-]*$/)
  end
  
end
