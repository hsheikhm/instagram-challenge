require 'rails_helper'

feature "commenting" do

  before do
    image = fixture_file_upload("files/test.jpg", "image/jpg")

    user = User.create(
      email: "hamza@makers.com",
      username: "hsheikhm",
      image: image,
      password: "letmein1",
      password_confirmation: "letmein1")

    Post.create(
      image: image,
      title: "test upload",
      user: user,
      time: Time.now)
  end

  scenario "allows users to leave a comment" do
    login
    expect(current_path).to eq "/"
    enter_comment
    within(:css, "li.post-comment > span.comment-user-thoughts") do
       expect(page).to have_content "testing comments"
    end
  end

end
