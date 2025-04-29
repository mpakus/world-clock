# frozen_string_literal: true

namespace :timezones do
  desc 'Export TimeZones'
  task export: :environment do
    File.write(path, Timezone.all.map(&:attributes).map { |h| h.except('id', 'created_at', 'updated_at') }.to_yaml)
  end

  desc 'Import TimeZones'
  task import: :environment do
    timezones = YAML.load_file(path)

    timezones.each do |tz|
      Timezone.create!(tz)
    end
  end

  private

  def path
    @path ||= Rails.root.join('db/timezones.yml')
  end
end
