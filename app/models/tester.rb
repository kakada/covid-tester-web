require 'csv'

class Tester < ApplicationRecord
  def self.to_csv
    attributes = %w{phone_number age gender lab_id visited_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |tester|
        record = [tester.phone_number, tester.age, tester.gender, tester.lab_id]
        record << tester.visited_at.in_time_zone('Asia/Bangkok') if tester.visited_at.present?
        
        csv << record
      end
    end
  end
end
