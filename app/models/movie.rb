class Movie < ActiveRecord::Base
belongs_to :user
     has_attached_file :poster, :styles => { 
     	 :medium => "500x300", :thumb => "100x100", :tiny => "50x50" }
  has_attached_file :video
     validates_attachment_content_type :poster, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

validates :poster, presence: true
validates :video, presence: true

end
