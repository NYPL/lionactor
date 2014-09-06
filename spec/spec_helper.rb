require "lionactor"

cwd = File.dirname(__FILE__)

MML = IO.read(File.join(cwd, "responses", "mml.json"))
SASB = IO.read(File.join(cwd, "responses", "sasb.json"))
LOCATIONS = IO.read(File.join(cwd, "responses", "all-locations.json"))
AMENITIES = IO.read(File.join(cwd, "responses", "all-amenities.json"))
AMENITIES_MML = IO.read(File.join(cwd, "responses", "amenities-mml.json"))
