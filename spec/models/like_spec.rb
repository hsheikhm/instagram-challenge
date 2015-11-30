require 'rails_helper'

describe Like, type: :model do

  it { is_expected.to belong_to :post }

  context "the likes count starts at 0" do

    it "when a user submits a post" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      post = Post.create(image: image, title: "test upload")
      expect(post.likes.count).to eq 0
    end
  end
end
