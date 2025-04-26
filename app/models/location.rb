# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :space
  belongs_to :timezone
end

# == Schema Information
#
# Table name: locations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  space_id    :bigint           not null
#  timezone_id :bigint           not null
#
# Indexes
#
#  index_locations_on_space_id     (space_id)
#  index_locations_on_timezone_id  (timezone_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#  fk_rails_...  (timezone_id => timezones.id)
#
