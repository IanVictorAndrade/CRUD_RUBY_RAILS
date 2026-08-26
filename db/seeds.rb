# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

unless Department.blank?
  Department.create!(name: "Networking")
  Department.create!(name: "Dispatch")
  Department.create!(name: "Marketing")
  Department.create!(name: "Shipping")
end

unless Country.blank?
  Country.create!(name: "Brazil")
  Country.create!(name: "UK")
  Country.create!(name: "Spain")
  Country.create!(name: "Italy")
end

unless State.blank?
  State.create!(name: "São Paulo", country_id: 1)
  State.create!(name: "Rio de Janeiro", country_id: 1)
  State.create!(name: "London", country_id: 2)
  State.create!(name: "Manchester", country_id: 2)
  State.create!(name: "Madrid", country_id: 3)
  State.create!(name: "Barcelona", country_id: 3)
  State.create!(name: "Rome", country_id: 4)
  State.create!(name: "Milan", country_id: 4)
end

unless City.blank?
  City.create!(name: "São Paulo", state_id: 1)
  City.create!(name: "Campinas", state_id: 1)
  City.create!(name: "Rio de Janeiro", state_id: 2)
  City.create!(name: "Niterói", state_id: 2)
  City.create!(name: "London", state_id: 3)
  City.create!(name: "Liverpool", state_id: 3)
  City.create!(name: "Manchester", state_id: 4)
  City.create!(name: "Salford", state_id: 4)
  City.create!(name: "Madrid", state_id: 5)
  City.create!(name: "Valencia", state_id: 5)
  City.create!(name: "Barcelona", state_id: 6)
  City.create!(name: "Seville", state_id: 6)
  City.create!(name: "Rome", state_id: 7)
  City.create!(name: "Naples", state_id: 7)
  City.create!(name: "Milan", state_id: 8)
  City.create!(name: "Turin", state_id: 8)
end

unless Allowancetype.blank?
  Allowancetype.create!(name: "HRA", percentage: 10)
  Allowancetype.create!(name: "CA", percentage: 15)
  Allowancetype.create!(name: "MA", percentage: 20)
  Allowancetype.create!(name: "PA", percentage: 25)
  Allowancetype.create!(name: "DA", percentage: 30)
  Allowancetype.create!(name: "EPF", percentage: 35)
  Allowancetype.create!(name: "FA", percentage: 40)
end

unless Account.blank?
  (1..15).each do |i|
    Account.create!(
      name: "Account #{i}",
      balance: rand(1000..10000)
    )
  end
end


if Belfastempregado.none?
  Belfastempregado.create!(firstname: "Connors",lastname:"McGregor",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Chad",lastname:"Mendis",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Nate",lastname:"Diaz",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Nick",lastname:"Diaz",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Anthony",lastname:"Joshua",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Michael",lastname:"Johnson",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Israel",lastname:"Adesanya",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Michael",lastname:"Chang",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Novak",lastname:"Djokovic",salary:5000,notes:'Notorious Guy!')

  Belfastempregado.create!(firstname: "Pete",lastname:"Samprass",salary:5000,notes:'Notorious Guy!')
end
