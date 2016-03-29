require 'rails_helper'
RSpec.describe User, type: :model do
  #before(:each) eo
    #@user = User.new
    #@user.first_name = "James"
    #@user.last_name = "Packers"
    #@user.email = "james@validemail.com"
   # @user.password = "Pessword12$"
   # @user.confirmation = "Pessword12$"
  #end

  it "should not save if email already exists." do
    User.create(
      first_name: "John",
      last_name: "Doe",
      email: "john@johndoe.com",
      password: "stringstring"
    )
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@johndoe.com",
      password: "stringstring"
    )
    expect(user).to be_invalid
  end

  it "should contain a valid email" do
    user = User.new(
      first_name: 'Guy',
      last_name: 'Fieri',
      email: "guyfieri"
    )
    expect(user).to be_invalid
  end

  it "should contain a unique email" do
    User.create(
      first_name: 'Guy',
      last_name: 'Fieri',
      email: "guyfieri@guy.com"
    )
    user = User.new(
      first_name: 'Guy',
      last_name: 'Fieri',
      email: "guyfieri@guy.com"
    )
    expect(user).to be_invalid
  end

  it "should not save if first_name field is blank." do
    user = User.new(
      first_name: ''
    )
    expect(user).to be_invalid
  end

  it "should not save if last_name field is blank." do
    user = User.new(
      last_name: ''
    )
    expect(user).to be_invalid
  end

  it "should not save if email field is blank." do
    user = User.new(
      email: ''
    )
    expect(user).to be_invalid
  end

  it "should not save if password field is blank." do
    user = User.new(
      last_name: ''
    )
    expect(user).to be_invalid
  end

  it 'password must be at least 6 characters long' do
    user = User.new(
      password: 'string'
      )
    expect(user).to be_invalid
  end
  it 'should have an encrypted password' do
    user = User.new(
      password: 'string'
    )
    expect(user.password).should_not be user.password_digest
  end
end
