organizations = JSON.parse(File.read(Rails.root + 'db/import_data/organizations.json'))
organizations.each_with_index do |organization, index|
  Organization.create(name: organization['name'], address: organization['address'])
  sleep 1 if (index + 1) % 5 == 0
end
illnesses = JSON.parse(File.read(Rails.root + 'db/import_data/illnesses.json'))
illnesses.each do |illness|
  Illness.create(name: illness['name'])
end

Illness.all.find_each do |illness|
  2.times do
    offset = rand(Organization.count)
    illness.organizations << Organization.offset(offset).first
  end
  illness.save
end

Organization.all.find_each do |organization|
  2.times do
    min = rand(0..100)
    organization.ages.create(min: min, max: rand(min..100))
  end
end
