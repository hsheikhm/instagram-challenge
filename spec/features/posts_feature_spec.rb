require 'rails_helper'

feature 'posts' do

  context "no images have been posted" do
    scenario "should display a link to post an image" do
      sign_up
      expect(page).to have_link "New Post"
    end
  end

  context "images have been posted" do

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

    scenario "display posts" do
      login
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
    end
  end

  context "submitting a new post" do
    scenario "prompts user to upload an image, then displays the new image" do
      sign_up
      post_image
      expect(current_path).to eq "/posts"
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
    end

    scenario "is not possible if title is left blank" do
      sign_up
      post_image_without_title
      expect(page).to have_content "Title can't be blank"
    end

    scenario "is not possible if image is left blank" do
      sign_up
      post_image_without_image
      expect(page).to have_content "Image can't be blank"
    end

    scenario "is not possible if the file uploaded is not an image" do
      sign_up
      post_image_with_invalid_file
      expect(page).to have_content "Image content type is invalid"
    end
  end
end
