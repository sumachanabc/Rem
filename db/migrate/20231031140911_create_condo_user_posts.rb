class CreateCondoUserPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :condo_user_posts do |t|
      t.string :title
      t.text :content
      t.references :condo_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
