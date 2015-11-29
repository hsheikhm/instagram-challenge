require 'rails_helper'

feature 'posts' do

  context "no images have been posted" do
    scenario "should display a prompt to post an image" do
      visit "/posts"
      expect(page).to have_content "No images posted yet"
      expect(page).to have_link "Make a Post"
    end
  end

  context "images have been posted" do
    scenario "display posts" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      Post.create(image: image, title: "test upload")
      visit "/posts"
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
    end
  end

  context "submitting a new post" do

    before { visit "/posts"; click_link "Make a Post" }

    scenario "prompts user to upload an image, then displays the new image" do
      post_image
      expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
      expect(current_path).to eq "/posts"
    end

    scenario "is not possible if title is left blank" do
      page.attach_file "Image", Rails.root + "spec/fixtures/files/test.jpg"
      fill_in "Title", with: ""
      click_button "Post Image"
      expect(page).to have_content "Title can't be blank"
    end

    scenario "is not possible if image is left blank" do
      fill_in "Title", with: "a blank image"
      click_button "Post Image"
      expect(page).to have_content "Image can't be blank"
    end

    scenario "is not possible if the file uploaded is not an image" do
      page.attach_file "Image", Rails.root + "spec/fixtures/files/text.txt"
      fill_in "Title", with: "a text file"
      click_button "Post Image"
      expect(page).to have_content "Image content type is invalid"
    end
  end
end
