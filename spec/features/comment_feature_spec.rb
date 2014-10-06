require 'rails_helper'
require_relative '../helpers/user_helpers.rb'

describe 'comments' do

    it 'should be posted on photos by users' do
        sign_up
        post_photo
        click_link "Write a comment"
        fill_in "Write a comment", with: "That sure is a wanky pic"
        click_button 'Submit'
        expect(page).to have_content "That sure is a wanky pic"
    end
    
end