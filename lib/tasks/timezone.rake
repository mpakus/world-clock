# frozen_string_literal: true

namespace :timezone do
  desc 'Move from Cities to Timezones'
  task migrate: :environment do
    cities.each do |city|
      Timezone.create(
        names: city['names'].sort,
        tz: city['tz'],
        utc: tz_to_utc(city['tz'])
      )
    end
    puts "[ DONE ]"
  end

  def tz_to_utc(tz)
    zone = ActiveSupport::TimeZone[tz]
    # zone.now.formatted_offset
    zone.now.utc_offset / 3600.0
  end

  def cities
    @cities ||= City.select("tz, ARRAY_AGG(name) AS names").group(:tz).order(names: :asc)
  end
end
