# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'sStar Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Seed
Category.create(name:'Sports', description:Faker::Lorem.sentence(3))
Category.create(name:'Education', description:Faker::Lorem.sentence(3))
Category.create(name:'Tecnology', description:Faker::Lorem.sentence(3))
Category.create(name:'Social', description:Faker::Lorem.sentence(3))




(1..50).each do |i|
  user = User.create(first_name:Faker::Name.first_name, last_name: Faker::Name.last_name ,email:Faker::Internet.unique.email ,sex:'M',password:Faker::Internet.password(8),image:Faker::Internet.url,description:Faker::Lorem.sentence(3),role:'User')
  user.generate_token_and_save
  project = Project.create(name:Faker::Company.name, description:Faker::Lorem.sentence(3), image:Faker::Internet.url, goal:Faker::Number.between(1000, 1000000), user_id:Faker::Number.between(1, i), current:0, limit_date: Faker::Date.forward(30))
  Comment.create(user_id:Faker::Number.between(1, i), project_id:Faker::Number.between(1, i), content:Faker::HarryPotter.quote)
  Investment.create(user_id:Faker::Number.between(1, i), project_id:Faker::Number.between(1, i), amount: Faker::Number.between(1, 200))
  user.categories << Category.find(Faker::Number.between(1,4))
  project.categories << Category.find(Faker::Number.between(1,4))

end



u = User.create(first_name:"Admin", last_name:"Admin" ,email:"admin@uc.com",sex:'M',password:'123123',image:"",description:"",role:'Admin')
u.generate_token_and_save
u = User.create(first_name:"Diego", last_name:"Passi" ,email:"djpassi@uc.cl",sex:'M',password:'123123',image:"/public/images/diego.jpg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"David", last_name:"Galemiri" ,email:"dagalemiri@uc.cl",sex:'M',password:'123123',image:"/public/images/david.jpg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"Jaime", last_name:"Navon" ,email:"jaimitonavon@uc.cl",sex:'M',password:'123123',image:"/public/images/navon.jpg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"Marc", last_name:"Suckerberg" ,email:"mark@uc.cl",sex:'M',password:'123123',image:"/public/images/mark.jpg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"Mar", last_name:"Perez" ,email:"mar@uc.cl",sex:'M',password:'123123',image:"/public/images/mar.jpeg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"Alersi", last_name:"Sanchez" ,email:"alexis@uc.cl",sex:'M',password:'123123',image:"/public/images/alexis.jpg",description:"",role:'User')
u.generate_token_and_save
u = User.create(first_name:"Steve", last_name:"Jobs" ,email:"steve@uc.cl",sex:'M',password:'123123',image:"/public/images/steve.jpg",description:"",role:'User')
u.generate_token_and_save
