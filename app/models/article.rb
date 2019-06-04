# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  start_time :datetime
#  study_time :string           not null
#  title      :string           not null
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#

class Article < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, presence: true
  validates :topic, presence: true
  validates :study_time, presence: true
  validates :title, presence: true
  validates :content, presence: true
end

