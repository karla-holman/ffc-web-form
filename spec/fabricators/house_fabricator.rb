Fabricator(:house) do
  address1 { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  country { Faker::Address.country_code }
  zip { Faker::Address.zip }
end
