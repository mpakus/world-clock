# frozen_string_literal: true

class City < ApplicationRecord
end

# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  tz         :string(64)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
