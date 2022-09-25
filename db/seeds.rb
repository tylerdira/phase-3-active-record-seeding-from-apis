# Add seed data in this file
puts 'Seeding spells...'
#Spells being added to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

#Iterate over each spell
spells.each do |spell|
    #make request to endpoint for individual spell
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    #use parse to convert response string to a Ruby hash
    spell_hash = JSON.parse(response)

    #create spell in the database using the data from the above hash
    Spell.create(
        name: spell_hash['name'],
        level: spell_hash['level'],
        description: spell_hash['desc'][0]
    )

end

puts "done seeding"