require 'rails_helper'
require_relative '../helpers/user_helpers.rb'

describe 'comments' do

  it 'should be posted on photos by users' do
    sign_up
    post_photo
    fill_in "Write a comment", with: "That sure is a wanky pic"
    click_button 'Submit'
    expect(page).to have_content "That sure is a wanky pic"
  end

  it 'should display the user who posted the comment' do
    sign_up
    post_photo
    fill_in "Write a comment", with: "That sure is a wanky pic"
    click_button 'Submit'
    expect(page).to have_content "andrew@gmail.com That sure is a wanky pic"
  end

  it 'should have a check box that deletes the comment when clicked' do
    sign_up
    post_photo
    fill_in "Write a comment", with: "That sure is a wanky pic"
    click_button 'Submit'
    click_link 'x'
    expect(page).to_not have_content "andrew@gmail.com That sure is a wanky pic"
  end

end

