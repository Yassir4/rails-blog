class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'Writer'
  belongs_to :following, class_name: 'Writer'
end
