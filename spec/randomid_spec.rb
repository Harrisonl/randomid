require 'spec_helper'

## SETTING UP TEST USER CLASS
class User < SuperModel::Base
  extend Randomid::ModelAdditions
  unique_identifier :uid, 8
end

describe Randomid do

  it 'has a version number' do
    expect(Randomid::VERSION).not_to be nil
  end

  it 'it sets the uid for the model passed in' do
    user = User.create
    expect(user.uid).not_to be nil
  end

  it "if a length is passed in, it uses that length" do
    alice = User.create
    expect(alice.uid.length).to eq(8)
  end

  it "doesn't let two objects have the same UID" do
    glen = User.create(uid: "123")
    rob = User.create
    expect(rob.uid).not_to eq(glen.uid)
  end

  it "should be URLSAFE" do
    tom = User.create
    expect(tom.uid).to match(/^[a-zA-Z0-9_-]*$/)
  end
  
end
