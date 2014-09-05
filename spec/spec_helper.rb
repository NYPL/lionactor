require "lionactor"

cwd = File.dirname(__FILE__)

MML = IO.read(File.join(cwd, "responses", "mml.json"))
LOCATIONS = IO.read(File.join(cwd, "responses", "all-locations.json"))
