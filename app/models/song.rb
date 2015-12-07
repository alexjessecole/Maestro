class Song < ActiveRecord::Base
	     belongs_to :user

	     has_attached_file :song

  validates_attachment_presence :song
  do_not_validate_attachment_file_type :song



end
