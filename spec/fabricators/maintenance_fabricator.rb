Fabricator(:maintenance) do
  title { Faker::Name.name }
  category { Maintenance.category.values.sample }
  priority { Maintenance.priority.values.sample }
  status { Maintenance.status.values.sample }
  description { Faker::Lorem.paragraph }
  house
  image_file_name { 'image.png' }
  image_file_size { 66456 }
  image_content_type { 'image/png' }
  image_updated_at { DateTime.current }
end
