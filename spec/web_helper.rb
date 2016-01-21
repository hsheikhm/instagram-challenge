def sign_up
  visit "/users/sign_up"
  fill_in "Email", with: "hamza@makers.com"
  fill_in "Username", with: "hsheikhm"
  page.attach_file "Profile Image", Rails.root + "spec/fixtures/files/test.jpg"
  fill_in "Password", with: "letmein1"
  fill_in "passwordconf-text-field", with: "letmein1"
  click_button "Sign up"
end

def login
  visit "/users/sign_in"
  fill_in "Email", with: "hamza@makers.com"
  fill_in "Password", with: "letmein1"
  click_button "Login"
end

def post_image
  visit "/"
  click_link "New Post"
  page.attach_file "new-image", Rails.root + "spec/fixtures/files/test.jpg"
  fill_in "new-post-title-text", with: "test upload"
  click_button "Post Image"
end

def post_image_without_title
  visit "/"
  click_link "New Post"
  page.attach_file "new-image", Rails.root + "spec/fixtures/files/test.jpg"
  fill_in "new-post-title-text", with: ""
  click_button "Post Image"
end

def post_image_without_image
  visit "/"
  click_link "New Post"
  fill_in "new-post-title-text", with: ""
  click_button "Post Image"
end

def post_image_with_invalid_file
  visit "/"
  click_link "New Post"
  page.attach_file "new-image", Rails.root + "spec/fixtures/files/text.txt"
  fill_in "new-post-title-text", with: ""
  click_button "Post Image"
end

def enter_comment
  visit "/"
  within(:css, "div.new-comment-form") do
    fill_in 'new-comment-text', with: "testing comments"
  end
  click_button "Submit"
end

def like_post
  visit "/"
  find(".likes-link").click
end
