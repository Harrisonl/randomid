require 'spec_helper'

## SETTING UP TEST USER CLASS
class User < SuperModel::Base
  extend Randomid::ModelAdditions
  unique_identifier(:uid, 16)
end

describe Randomid::ModelAdditions do
  it "generates the unique identifier before an object is created" do
    user = User.new(uid: "")
    user.save
    expect(user.uid).not_to be nil
  end
end
