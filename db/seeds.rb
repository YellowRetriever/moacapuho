# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Provider.destroy_all
Item.destroy_all
provider=Provider.create(name:"aaa", email:"sample@email.com",password:"111111",password_confirmation:"111111")
Item.create(name:"cupholuder",status:1,prefecture:"osaka",city:"osaka",address:"ikunoku",text:"aaa",provider_id:provider.id)