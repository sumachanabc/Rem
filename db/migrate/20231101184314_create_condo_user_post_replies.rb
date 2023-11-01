class CreateCondoUserPostReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :condo_user_post_replies do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :condo_user_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
