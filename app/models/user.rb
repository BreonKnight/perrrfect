class User < ActiveRecord::Base
  #for paperclip avatar uploading
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #allows username to be the path for user instead of id number
  def to_param
    name
  end
  #bcrypt safe password
  has_secure_password
end
