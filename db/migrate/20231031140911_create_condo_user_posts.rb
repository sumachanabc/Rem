class CreateCondoUserPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :condo_user_posts do |t|
      t.string     :title,      null: false
      t.text       :content,    null: false
      t.integer    :status,     null: false, default: 0

      t.references :condo_user, null: false, foreign_key: true
      t.references :condo,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
