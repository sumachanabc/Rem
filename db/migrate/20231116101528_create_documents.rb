class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title,                        null: false
      t.string :category_id,                  null: false
      t.references :condo, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
