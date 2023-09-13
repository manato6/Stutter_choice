# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jobs = [
  "営業", "公務員",
  "事務", "人事・経理・総務・企画", "販売・接客・サービス", "飲食",
  "医療・介護・福祉", "デザイナー", "その他"
]

jobs.each do |job|
  Job.find_or_create_by(job_name: job)
end

admins = [
  {email: 'admin1@example.com', password: '123456'},
  {email: 'admin2@example.com', password: '123456'},
]

admins.each do |admin|
  Admin.find_or_create_by(email: admin[:email]) do |a|
    a.password = admin[:password]
  end
end