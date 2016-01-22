require 'rails_helper'

describe User, type: :model do

  it { is_expected.to have_many :posts }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_attached_file(:image) }

  it { is_expected.to validate_attachment_presence(:image) }

  it { is_expected.to validate_attachment_content_type(:image).
                allowing('image/png', 'image/jpg').
                rejecting('text/plain', 'text/xml')}

  context "should have the following:" do

    it "email address" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      user = User.create(
        email: "",
        username: "hsheikhm",
        image: image,
        password: "letmein1",
        password_confirmation: "letmein1")
      expect(user).not_to be_valid
    end

    it "username" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      user = User.create(
        email: "hamza@makers.com",
        username: "",
        image: image,
        password: "letmein1",
        password_confirmation: "letmein1")
      expect(user).not_to be_valid
    end

    it "password" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      user = User.create(
        email: "hamza@makers.com",
        username: "hsheikhm",
        image: image,
        password: "",
        password_confirmation: "letmein1")
      expect(user).not_to be_valid
    end

    it "password that is a minimum of 8 characters" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      user = User.create(
        email: "hamza@makers.com",
        username: "hsheikhm",
        image: image,
        password: "letmein",
        password_confirmation: "letmein")
      expect(user).not_to be_valid
    end

    it "password confirmation" do
      image = fixture_file_upload("files/test.jpg", "image/jpg")
      user = User.create(
        email: "hamza@makers.com",
        username: "hsheikhm",
        image: image,
        password: "letmein1",
        password_confirmation: "")
      expect(user).not_to be_valid
    end
  end
end
