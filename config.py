worlds["Swellserve"] = "/home/bschlenk/minecraft/world"

notree_render = [Base(), EdgeLines(), Lighting(), Hide(blocks=[18, 106, 78])]
dry_render = [Base(), EdgeLines(), NoFluids(), Hide(blocks=[79])]
open_nether_render = [Base(), EdgeLines(), Hide(blocks=[87])]

def playerFilter(poi):
	if poi['id'] == 'Player':
		return poi['EntityId']

renders["swellserve_day"] = {
	"world" : "Swellserve",
	"title" : "Day",
	"rendermode" : "lighting",
	"dimension" : "overworld",
	"markers" : [dict(name="Players", filterFunction=playerFilter, checked=True)],
}

renders["swellserve_night"] = {
	"world" : "Swellserve",
	"title" : "Night",
	"rendermode" : "night",
	"dimension" : "overworld",
}

renders["swellserve_south"] = {
	"world" : "Swellserve",
	"title" : "South",
	"rendermode" : "normal",
	"dimension" : "overworld",
	"northdirection" : "lower-right",
}

renders["swellserve_notrees"] = {
	"world" : "Swellserve",
	"title" : "No Canopy",
	"rendermode" : notree_render,
	"dimension" : "overworld",
}

renders["swellserve_dry"] = {
	"world" : "Swellserve",
	"title" : "Dry",
	"rendermode" : dry_render,
	"dimension" : "overworld",
}

renders["swellserve_nether"] = {
	"world" : "Swellserve",
	"title" : "Nether",
	"rendermode" : "nether_lighting",
	"dimension" : "nether",
	"markers" : [dict(name="Players", filterFunction=playerFilter, checked=True)],
}

renders["swellserve_nether_norack"] = {
	"world" : "Swellserve",
	"title" : "No Netherrack",
	"rendermode" : open_nether_render,
	"dimension" : "nether",
}

outputdir = "/home/bschlenk/minecraft/mcmap"
