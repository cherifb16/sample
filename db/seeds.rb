# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_initialize_by(email: 'health@gmail.com')
user.password = 'admin@12345'
user.user_role = 'admin'
user.save!

30.times do |t|
    user = Doctor.create! :first_name => "Winny#{t}",
                        :last_name => "uwi #{t}",
                        :city => "Unknown#{t}",
                        :username => 'winny',
                        :address => "Rwanda#{t}",
                        :primary_practice  => "Nurse#{t}",
                        :secondary_practice=> "Pediatry#{t}",
                        :gcmid => 'Blood pressure'
  
  end
