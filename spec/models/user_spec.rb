require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it 'should have an email address' do
    user = User.new(email: "wrong")
    expect(user).to have(1).error_on(:email)
  end

end
