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
    {genre_name: 'その他'},
    {genre_name: 'その他(飲食店)'},
    {genre_name: 'その他(その他ユーザー)'}
    ]
)



Admin.create!(
    email: 'admin@admin.com',
    password: 'admintest'
  )