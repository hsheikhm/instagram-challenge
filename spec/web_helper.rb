def post_image
  visit '/posts'
  click_link 'Make a Post'
  page.attach_file 'Image', Rails.root + 'spec/fixtures/files/test.jpg'
  fill_in 'Title', with: 'a test image'
  click_button 'Post Image'
end
