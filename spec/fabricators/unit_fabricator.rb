Fabricator(:unit) do
  name { Faker::Name.name }
  lease_start { Date.today }
  lease_end { Date.today + 1.year }
  rent { 105.001234 }
  house
  lease_file_name { 'lease.pdf' }
  lease_file_size { 66456 }
  lease_content_type { 'application/pdf' }
  lease_updated_at { DateTime.current }
end
