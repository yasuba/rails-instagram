require 'rails_helper'
require_relative '../helpers/user_helpers.rb'

include UserHelpers

describe 'posts' do

  context 'before any posts are added' do

    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end

  end

  context 'once posts have been added' do

    it 'posts should be displayed' do
      sign_up
      post_photo
      expect(page).to have_content "A photo of my breakfast"
      expect(page).not_to have_content "No posts yet"
    end

  end

  context 'when adding posts' do

    it 'prompts the user to fill in a form, then displays the post' do
      sign_up
      post_photo
      expect(page).to have_css 'img'
      expect(current_path).to eq '/posts'
    end

    it 'should display the user who posted the photo' do
      sign_up
      post_photo
      expect(page).to have_content 'andrew@gmail.com'
    end

  end

  context 'when deleting posts' do

    it 'removes a post when the user clicks delete photo' do
      sign_up
      post_photo
      click_link 'Delete photo'
      expect(page).not_to have_css 'img'
      expect(page).to have_content 'Photo deleted successfully'
    end

  end

end