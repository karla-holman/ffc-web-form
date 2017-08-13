Fabricator(:house) do
  address1 { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  country { Faker::Address.country_code }
  zip { Faker::Address.zip }
  image_file_name { 'image.png' }
  image_file_size { 66456 }
  image_content_type { 'image/png' }
  image_updated_at { DateTime.current }
end
