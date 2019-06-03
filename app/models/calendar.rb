# == Schema Information
#
# Table name: calendars
#
#  id         :integer          not null, primary key
#  end        :datetime
#  start      :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_calendars_on_user_id  (user_id)
#

class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
