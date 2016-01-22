require 'rails_helper'

describe Post, type: :model do

  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :likes }

  it { is_expected.to have_attached_file(:image) }

  it { is_expected.to validate_attachment_presence(:image) }

  it { is_expected.to validate_attachment_content_type(:image).
                allowing('image/png', 'image/jpg').
                rejecting('text/plain', 'text/xml')}

  it "should require a title" do
    image = fixture_file_upload("files/test.jpg", "image/jpg")
    expect(Post.new(image: image, title: "")).not_to be_valid
  end

end
