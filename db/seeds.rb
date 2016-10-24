organizations = JSON.parse(File.read(Rails.root + 'test/fixtures/files/organizations.json'))
organizations.each_with_index do |organization, index|
  Organization.create(name: organization['name'], address: organization['address'])
  sleep 1 if (index + 1) % 5 == 0
end
illnesses = JSON.parse(File.read(Rails.root + 'test/fixtures/files/illnesses.json'))
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
