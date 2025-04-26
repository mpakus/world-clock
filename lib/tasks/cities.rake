# frozen_string_literal: true

namespace :cities do
  desc "Extract city and time zone from db/cities15000.txt, convert to JSON, and save to db/cities.json"
  task convert: :environment do
    source_file = Rails.root.join("db/cities15000.txt")
    output_file = Rails.root.join("db/cities.json")

    data = []
    File.foreach(source_file) do |line|
      columns = line.strip.split("\t")
      next if columns.size < 3

      city_name = columns[1]
      time_zone = columns[17]
      data << { name: city_name, tz: time_zone }
    end

    File.write(output_file, data.to_json)
    puts "Successfully created #{output_file}"
  end

  desc 'Import JSON to DB'
  task import: :environment do
    source_file = Rails.root.join("db/cities.json")
    data = JSON.parse(File.read(source_file))

    data.each do |city|
      City.find_or_create_by(name: city['name']) do |c|
        c.tz = city['tz']
      end
      putc '.'
    end

    puts "\nSuccessfully imported cities from #{source_file}"
  end
end
