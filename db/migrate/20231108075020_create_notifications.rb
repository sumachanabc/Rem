class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :visitor, polymorphic: true, null: false
      t.references :visited, polymorphic: true, null: false
      t.references :condo_user_post, foreign_key: true
      t.references :condo_user_post_reply, foreign_key: { to_table: :condo_user_post_replies }
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
