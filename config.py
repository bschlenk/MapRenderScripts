import os, sys
sys.path.append('/home/bschlenk/minecraft')

worlds["bschlenk"] = os.environ['WORLD_DIR']
outputdir = os.environ['MAP_DIR']
htmltitle="Schlenker's World"
texturepath = os.environ['TEXTURE_PATH']

notree_render = [Base(), EdgeLines(), Hide(blocks=[18, 106, 78])]
dry_render = [Base(), EdgeLines(), NoFluids(), Hide(blocks=[79, 78])]
open_nether_render = [Base(), EdgeLines(), NoFluids(), Hide(blocks=[87, 7, 88])]

def playerFilter(poi):
	from death_compiler import get_player_deaths
	if poi['id'] == 'Player':
		name = poi['EntityId']
		num_deaths = get_player_deaths(name)
		poi['icon'] = "http://overviewer.org/avatar/%s" % poi['EntityId']
		return "%s\nDeaths: %d\nLocation: %d, %d, %d" % (name, num_deaths, poi['x'], poi['y'], poi['z'])

playerMarker = dict(name="Players", filterFunction=playerFilter, checked=True)

renders["bschlenk_day"] = {
	"world" : "bschlenk",
	"title" : "Day",
	"rendermode" : "lighting",
	"dimension" : "overworld",
	"markers" : [playerMarker],
}

'''renders["bschlenk_night"] = {
	"world" : "bschlenk",
	"title" : "Night",
	"rendermode" : "night",
	"dimension" : "overworld",
	"markers" : [playerMarker],
}'''

'''renders["bschlenk_south"] = {
	"world" : "bschlenk",
	"title" : "South",
	"rendermode" : "normal",
	"dimension" : "overworld",
	"northdirection" : "lower-right",
	"markers" : [playerMarker],
}'''

'''renders["bschlenk_notrees"] = {
	"world" : "bschlenk",
	"title" : "No Canopy",
	"rendermode" : notree_render,
	"dimension" : "overworld",
	"markers" : [playerMarker],
}'''

'''renders["bschlenk_dry"] = {
	"world" : "bschlenk",
	"title" : "Dry",
	"rendermode" : dry_render,
	"dimension" : "overworld",
	"markers" : [playerMarker],
}'''

'''renders["bschlenk_nether"] = {
	"world" : "bschlenk",
	"title" : "Nether",
	"rendermode" : "nether_lighting",
	"dimension" : "nether",
	"markers" : [playerMarker],
}'''

'''renders["bschlenk_nether_norack"] = {
	"world" : "bschlenk",
	"title" : "No Netherrack",
	"rendermode" : open_nether_render,
	"dimension" : "nether",
	"markers" : [playerMarker],
}'''

