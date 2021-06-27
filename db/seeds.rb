# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  [
    {genre_name: '野菜'},
    {genre_name: '果物'},
    {genre_name: '米・雑穀'},
    {genre_name: '加工食品'},
    {genre_name: '飲料'},
    {genre_name: 'その他'}
    ]
)

 5.times do |n|
    Customer.create!(
      email: "test#{n}@gmail.com",
      encrypted_password: "testtarou#{n}",
      customer_first_name: "太郎#{n}",
      customer_last_name: "テスト",
      customer_first_name_kane: "タロウ#{n}",
      customer_last_name_kane: "テスト",
      shop_name: "テスト太郎#{n}のお店",
      shop_description: "テスト太郎#{n}のお店です。テスト太郎#{n}の商品を販売しています。",
      customer_image_id: File.open("./app/assets/images/no_image.jpg"),
      
    )
  end
  
  