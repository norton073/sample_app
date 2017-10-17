require 'rails_helper'

describe User do

  # before { @user = User.new(name: "Example User", email: "user@example.com") }
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }
  # it "should be valid" do
  #   expect(@user).to be_valid
  # end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
