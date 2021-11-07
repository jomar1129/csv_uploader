json.extract! story, :id, :name, :location, :species, :gender, :affiliations, :weapon, :vehicle, :created_at, :updated_at
json.url story_url(story, format: :json)
