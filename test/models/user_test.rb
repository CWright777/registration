require 'test_helper'

class UserTest < ActiveSupport::TestCase
  before(:each) do
    @user = User.new
    @user.first_name = "James"
    @user.last_name = "Packers"
    @user.email = "james@validemail.com"
    @user.password = "Pessword12$"
    @user.confirmation = "Pessword12$"
  end
end
