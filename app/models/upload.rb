class Upload < ActiveRecord::Base
  attr_accessible :upload
  has_attached_file :upload,
    styles: { 
      original: "600x600>", 
      thumbnail: "40x40#" 
    }
  

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE",
      "thumbnail_url" => upload.url(:thumbnail)
    }
  end

end
