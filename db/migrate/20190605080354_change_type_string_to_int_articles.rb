class ChangeTypeStringToIntArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :study_time, :integer
  end
end
