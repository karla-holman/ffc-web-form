Fabricator(:attachment) do
  name { Faker::Lorem.word }
  description { Faker::Lorem.paragraph }
  page { Page.create }
  file_attachment_file_name { 'image.png' }
  file_attachment_file_size { 66456 }
  file_attachment_content_type { 'image/png' }
  file_attachment_updated_at { DateTime.current }
end
