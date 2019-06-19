json.array! @places.each do |place|
  json.partial! "place.json.jbuilder", place: place
end