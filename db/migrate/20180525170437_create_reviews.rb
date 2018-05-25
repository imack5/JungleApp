class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: { on_delete: :cascade }
      t.references :user, foreign_key: { on_delete: :cascade }
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
