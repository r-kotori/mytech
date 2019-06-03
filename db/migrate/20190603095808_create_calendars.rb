class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.datetime :start
      t.datetime :end


      t.timestamps
    end
  end
end
