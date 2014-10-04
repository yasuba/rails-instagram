require 'rails_helper'

describe 'posts' do

    context 'no posts added yet' do

        it 'should display a prompt to add a post' do
            visit '/posts'
            expect(page).to have_content 'No photos yet'
            expect(page).to have_link 'Post a picture'
        end

    end

    context 'displaying posts' do

        before do
            Post.create(description: "A photo of my breakfast")
        end

        it 'should display the post' do
            visit '/posts'
            expect(page).to have_content "A photo of my breakfast"
            expect(page).not_to have_content "No posts yet"
        end

    end

    context 'adding posts' do

        it 'prompts the user to fill in a form, then displays the post' do
            visit '/posts'
            click_link 'Post a picture'
            attach_file('Image', 'spec/features/breakfast.jpg')
            fill_in 'Description', with: 'A photo of my breakfast'
            click_button 'Submit photo'
            expect(page).to have_css 'img'
            expect(current_path).to eq '/posts'
        end

    end

    context 'deleting posts' do

        before do
            Post.create(description: "A photo of my breakfast")
        end

        it 'removes a post when the user clicks delete photo' do
            visit '/posts'
            click_link 'Delete photo'
            expect(page).not_to have_css 'img'
            expect(page).to have_content 'Photo deleted successfully'
        end

    end


end