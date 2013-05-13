worlds["bschlenk"] = "/home/bschlenk/minecraft/world"
outputdir = "/home/bschlenk/minecraft_map"

notree_render = [Base(), EdgeLines(), Lighting(), Hide(blocks=[18, 106, 78])]
dry_render = [Base(), EdgeLines(), NoFluids(), Hide(blocks=[79])]
open_nether_render = [Base(), EdgeLines(), Hide(blocks=[87, 7])]

def playerFilter(poi):
	if poi['id'] == 'Player':
		return poi['EntityId']

renders["bschlenk_day"] = {
	"world" : "bschlenk",
	"title" : "Day",
	"rendermode" : "lighting",
	"dimension" : "overworld",
	"markers" : [dict(name="Players", filterFunction=playerFilter, checked=True)],
}

renders["bschlenk_night"] = {
	"world" : "bschlenk",
	"title" : "Night",
	"rendermode" : "night",
	"dimension" : "overworld",
}

renders["bschlenk_south"] = {
	"world" : "bschlenk",
	"title" : "South",
	"rendermode" : "normal",
	"dimension" : "overworld",
	"northdirection" : "lower-right",
}

renders["bschlenk_notrees"] = {
	"world" : "bschlenk",
	"title" : "No Canopy",
	"rendermode" : notree_render,
	"dimension" : "overworld",
}

renders["bschlenk_dry"] = {
	"world" : "bschlenk",
	"title" : "Dry",
	"rendermode" : dry_render,
	"dimension" : "overworld",
}

renders["bschlenk_nether"] = {
	"world" : "bschlenk",
	"title" : "Nether",
	"rendermode" : "nether_lighting",
	"dimension" : "nether",
	"markers" : [dict(name="Players", filterFunction=playerFilter, checked=True)],
}

renders["bschlenk_nether_norack"] = {
	"world" : "bschlenk",
	"title" : "No Netherrack",
	"rendermode" : open_nether_render,
	"dimension" : "nether",
}

