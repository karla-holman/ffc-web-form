Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'password' }
  password_confirmation { 'password' }
end

Fabricator(:admin_user, class_name: :user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'password' }
  password_confirmation { 'password' }
  admin { true }
end
