require 'rails_helper'

feature 'liking posts' do

  scenario "a user can like a post, which increments the likes count", js: true do
    post_image
    like_post
    expect(page).to have_content "1 like"
  end

end
