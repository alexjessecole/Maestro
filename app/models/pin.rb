class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, source_file_options: { all: '-auto-orient' }, :styles => { 
     	 :medium => "500x300", :thumb => "100x100", :tiny => "50x50" }
validates :image, presence: true
acts_as_votable
end