class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text, null: false
      t.timestamps null: false
    end
  end
end
