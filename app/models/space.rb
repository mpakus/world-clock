# frozen_string_literal: true

class Space < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :timezones, through: :locations
end

# == Schema Information
#
# Table name: spaces
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
