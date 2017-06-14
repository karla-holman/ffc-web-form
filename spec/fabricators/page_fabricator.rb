Fabricator(:page) do
  name { Faker::Address.city }
  content { "<p>#{ Faker::Lorem.paragraph }</p>" }
end
