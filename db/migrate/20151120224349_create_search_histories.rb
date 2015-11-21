class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.integer :user_id, null: false
      t.string :twitter_handle

      t.timestamps null: false
    end
    add_reference :search_histories, :users, index: true, foreign_key: :user_id
  end
end
