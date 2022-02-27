require "csv"

namespace :import do
  desc "import user data"
  task users: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "coding-challenge.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      t = User.new
      t.first_name = row["FIRST NAME"]
      t.middle_initial = row["MIDDLE INITIAL"]
      t.last_name = row["LAST NAME"]
      t.prefix = row["PREFIX"]
      t.address_1 = row["ADDRESS 1"]
      t.address_2 = row["ADDRESS 2"]
      t.city = row["CITY"]
      t.state = row["STATE"]
      t.zip_code = row["ZIP CODE"]
      t.education = row["EDUCATION"]
      t.estimated_income = row["ESTIMATED INCOME"]
      t.save
    end

  end

end
