class Notification < ApplicationRecord
  belongs_to :visitor, polymorphic: true
  belongs_to :visited, polymorphic: true
  belongs_to :condo_user_post
  belongs_to :condo_user_post_reply, class_name: 'CondoUserPostReply'

end
