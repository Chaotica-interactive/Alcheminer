extends Node2D

# Grid Properties
var columns = 10
var rows = 10

var grid_map: Array = []

onready var tile_map: TileMap = $TileMap

func _ready():
	generate_grid_map()
	draw_tiles()

# Draw Tiles on Tilemap
func draw_tiles():
	for x in range (0, rows):
		for y in range (0, columns):
			var point1 = grid_map[x][y]
			var point2 = grid_map[x][y+1]
			var point3 = grid_map[x+1][y+1]
			var point4 = grid_map[x+1][y]

			# Assign total tile value
			var tile_value = point1 + (point2*2) + (point3*4) + (point4*8)

			print(point1, point2)
			print(point4, point3)
			print("(", tile_value, ")")
			
			# Set Tile
			tile_map.set_cellv(Vector2(y, x), tile_value)

# Generate Grid Map Point Values		
func generate_grid_map():
	for x in range(0, rows + 1):
		grid_map.append([]) # add a collumn
		for y in range(0, columns + 1):
			var random_value = int(rand_range(0,2))

			grid_map[x].append(random_value)
		print(grid_map[x])
