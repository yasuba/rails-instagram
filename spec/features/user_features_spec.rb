require 'rails_helper'
require_relative '../helpers/user_helpers.rb'

include UserHelpers

describe 'user' do

  it "is able to sign up for an account" do
    sign_up
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(current_path).to eq '/'
  end

  it "is able to sign in when they have an account" do
    sign_in
    expect(current_path).to eq "/users/sign_in"

  end

end