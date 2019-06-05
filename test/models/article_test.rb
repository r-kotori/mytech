# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  start_time :datetime
#  study_time :integer          not null
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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
