class Image < ApplicationRecord
    include ::PhotoUploader::Attachment.new(:image)
end
