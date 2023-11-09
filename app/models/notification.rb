class Notification < ApplicationRecord
  belongs_to :visitor, polymorphic: true
  belongs_to :visited, polymorphic: true
  belongs_to :condo_user_post, optional: true
  belongs_to :condo_user_post_reply, optional: true

  def condo_id
    CondoUserPost.find_by(id: condo_user_post_id)&.condo_id
  end

end
