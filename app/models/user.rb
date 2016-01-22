class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :image, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
