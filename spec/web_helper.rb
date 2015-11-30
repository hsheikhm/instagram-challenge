def post_image
  visit "/posts"
  click_link "Make a Post"
  page.attach_file "Image", Rails.root + "spec/fixtures/files/test.jpg"
  fill_in "Title", with: "test upload"
  click_button "Post Image"
end

def enter_comment
  visit "/posts"
  within("//div[contains(@src, 'test.jpg')]") do
    fill_in "Thoughts", with: "testing comments"
  end
  click_button "Leave Comment"
end

def like_post
  visit "/posts"
  click_on("likes-link")
end
