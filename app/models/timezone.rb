# frozen_string_literal: true

class Timezone < ApplicationRecord
  has_many :locations, dependent: :destroy
end

# == Schema Information
#
# Table name: timezones
#
#  id         :bigint           not null, primary key
#  names      :string           default([]), is an Array
#  tz         :string
#  utc        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
