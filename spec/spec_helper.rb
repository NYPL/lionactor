require "lionactor"

cwd = File.dirname(__FILE__)

MML = IO.read(File.join(cwd, "responses", "mml.json"))
SASB = IO.read(File.join(cwd, "responses", "sasb.json"))
LOCATIONS = IO.read(File.join(cwd, "responses", "all-locations.json"))
AMENITY = IO.read(File.join(cwd, "responses", "amenity-computers.json"))
AMENITY_NO_ACTION = IO.read(File.join(cwd, "responses", "amenity-photocopiers.json"))
AMENITIES = IO.read(File.join(cwd, "responses", "all-amenities.json"))
AMENITIES_MML = IO.read(File.join(cwd, "responses", "amenities-mml.json"))
RAREBOOKS = IO.read(File.join(cwd, "responses", "rare-books.json"))
ARENTS = IO.read(File.join(cwd, "responses", "arents.json"))

