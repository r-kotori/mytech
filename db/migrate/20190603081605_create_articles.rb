class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :topic, null: false
      t.string :title, null: false
      t.string :study_time, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
