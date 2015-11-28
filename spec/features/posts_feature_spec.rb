require 'rails_helper'

feature 'posts' do

  context 'no images have been posted' do
    scenario 'should display a prompt to post an image' do
      visit '/posts'
      expect(page).to have_content 'No images posted yet'
      expect(page).to have_link 'Make a Post'
    end
  end
end
