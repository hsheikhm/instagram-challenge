require 'rails_helper'

feature "commenting" do

  before do
    image = fixture_file_upload("files/test.jpg", "image/jpg")
    Post.create(image: image, title: "test upload")
  end

  scenario "allows users to leave a comment" do
    enter_comment
    expect(current_path).to eq "/posts"
    within("//div[contains(@src, 'test.jpg')]") do
      expect(page).to have_content "testing comments"
    end
  end

end
