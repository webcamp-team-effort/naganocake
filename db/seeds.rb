# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create!(email: "admin@example.jp",
              password: "12345678"
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

Product.create!(
  [
    {
      genre_id: "1",
      name: "アップルパイ",
      explanation: "長野県産のシナノゴールドを使ったアップルパイです。",
      tax_included_price: "900",
      image: File.open("./app/assets/images/アップルパイ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "タルト",
      explanation: "長野県産の生乳を使ったタルトです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/タルト.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "イチゴのタルト",
      explanation: "長野県産のイチゴを使ったタルトです。",
      tax_included_price: "800",
      image: File.open("./app/assets/images/イチゴのタルト.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "オペラ",
      explanation: "長野県産のチョコを使った濃厚なチョコケーキです。",
      tax_included_price: "600",
      image: File.open("./app/assets/images/オペラ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "4",
      name: "カップケーキ",
      explanation: "長野県産の生乳を使ったシンプルなカップケーキです。",
      tax_included_price: "500",
      image: File.open("./app/assets/images/カップケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "2",
      name: "フルーツキャンディ",
      explanation: "長野県産フルーツの果汁を使ったキャンディです。",
      tax_included_price: "600",
      image: File.open("./app/assets/images/キャンディ２.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "4",
      name: "チョコクッキー",
      explanation: "長野県産のチョコと小麦粉を使ったクッキーです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/クッキー.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "2",
      name: "フルーツグミ",
      explanation: "長野県産フルーツの果汁を使ったキャンディです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/グミ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "チーズケーキ",
      explanation: "長野県産のチーズを使った濃厚でシンプルなチーズケーキです。",
      tax_included_price: "900",
      image: File.open("./app/assets/images/チーズケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "3",
      name: "チョコプリン",
      explanation: "長野県産のチョコと生乳をふんだんに使った濃厚なプリンです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/チョコプリン.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "3",
      name: "ビターチョコプリン",
      explanation: "長野県産のチョコと生乳をふんだんに使った濃厚なプリンです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/チョコプリン２.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "大人のティラミス",
      explanation: "長野県産のコーヒーを使用したティラミスです。",
      tax_included_price: "1000",
      image: File.open("./app/assets/images/ティラミス.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "甘いティラミス",
      explanation: "長野県産の蜂蜜を使用したティラミスです。",
      tax_included_price: "900",
      image: File.open("./app/assets/images/ティラミス２.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "4",
      name: "パウンドケーキ",
      explanation: "長野県産の生乳を使用したシンプルなパウンドケーキです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/パウンドケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "3",
      name: "プリン",
      explanation: "長野県産の生乳を使用したシンプルなプリンです。",
      tax_included_price: "500",
      image: File.open("./app/assets/images/プリン.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "フルーツケーキ",
      explanation: "長野県産のフルーツを使用した贅沢な逸品です。",
      tax_included_price: "1200",
      image: File.open("./app/assets/images/フルーツケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "フルーツたっぷりケーキ",
      explanation: "長野県産のフルーツたっぷりと使用した贅沢な逸品です。",
      tax_included_price: "3000",
      image: File.open("./app/assets/images/フルーツたっぷりケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "フルーツタルト",
      explanation: "長野県産のフルーツを使用した爽やかな逸品です。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/フルーツタルト.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "ブルーベリーチーズ",
      explanation: "長野県産のブルーベリーとチーズを使用したmade of naganoな逸品です。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/ブルーベリーチーズ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "4",
      name: "ベリーカップケーキ",
      explanation: "長野県産のベリーを使用した爽やかな甘酸っぱさが特徴のカップケーキです。",
      tax_included_price: "700",
      image: File.open("./app/assets/images/ベリーカップケーキ.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "4",
      name: "信州マカロン",
      explanation: "サクッとした軽い食感が特徴のマカロンです。",
      tax_included_price: "800",
      image: File.open("./app/assets/images/マカロン.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "ミックスベリータルト",
      explanation: "長野県産のブルーベリーを使用したタルトです。",
      tax_included_price: "900",
      image: File.open("./app/assets/images/ミックスベリータルト.jpeg", ?r),
      on_sale: "1"
    },
    {
      genre_id: "1",
      name: "レアチーズケーキ",
      explanation: "長野県の牛の牛乳から作ったチーズを使用したチーズケーキです。",
      tax_included_price: "900",
      image: File.open("./app/assets/images/レアチーズケーキ.jpeg", ?r),
      on_sale: "1"
    },
  ]
)