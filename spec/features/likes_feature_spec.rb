require 'rails_helper'

feature 'liking posts' do

  before do
    image = fixture_file_upload("files/test.jpg", "image/jpg")
    Post.create(image: image, title: "test upload")
  end

  scenario "a user can like a post, which increments the likes count", js: true do
    like_post
    expect(page).to have_content "1 like"
  end

end
