require 'rails_helper'

feature 'posts' do

  context 'no images have been posted' do
    scenario 'should display a prompt to post an image' do
      visit '/posts'
      expect(page).to have_content 'No images posted yet'
      expect(page).to have_link 'Make a Post'
    end
  end

  context 'images have been posted' do
    scenario 'display posts' do
      image = fixture_file_upload('files/test.jpg', 'image/jpg')
      Post.create(image: image, title: 'test upload')
      visit '/posts'
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
    end
  end

  context 'posting images' do
    scenario 'prompts user to upload an image, then displays the new image' do
      post_image
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
      expect(current_path).to eq '/posts'
    end
  end

end
