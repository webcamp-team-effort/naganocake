# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create!(email: "admin@example.jp",
              password: "12345678",
              )

Customer.create!(
last_name:"佐藤" ,
first_name: "健",
last_kana_name: "サトウ",
first_kana_name: "タケル",
password: "123456",
email: "1@1",
postcode: "0000001",
address: "東京都港区1-1-1",
phone_number: "0120000222"
)
	Customer.create!(
last_name:"鈴木" ,
first_name: "一朗",
last_kana_name: "スズキ",
first_kana_name: "イチロー",
password: "123456",
email: "2@2",
postcode: "0000002",
address: "東京タワー",
phone_number: "0120111222"
)
Customer.create!(
last_name:"手越" ,
first_name: "祐也",
last_kana_name: "テゴシ",
first_kana_name: "ユウヤ",
password: "123456",
email: "3@3",
postcode: "0000003",
address: "ジャニーズ事務所",
phone_number: "0120123678"
)
Customer.find_each do |customer|
  # delivery
  3.times do |num|
    Delivery.create!(
      customer_id: customer.id,
      postcode: "999999#{num}",
      address: "埼玉県川越市#{num}",
      name: "右京#{num}様"
    )
  end
end


genre_names = [
  'ケーキ',
  'キャンディ',
  'プリン',
  '焼き菓子'
]
genre_names.each do |genre_name|
  Genre.create!(
    name: genre_name,
  )
end