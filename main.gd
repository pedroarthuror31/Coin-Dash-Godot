extends Node

@export var coin_scene : PackedScene
@export var powerup_scene : PackedScene
@export var obstacle_scene : PackedScene
@export var playtime = 30


var level = 1
var score = 0
var time_left = 0
var screensize = Vector2.ZERO
var playing = false

func _ready():
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	$Player.hide()


func new_game():
	playing = true
	level = 1
	score = 0
	time_left = playtime
	$Player.start()
	$Player.show()
	$GameTimer.start()
	spawn_coins()
	$HUD.update_score(score)
	$HUD.update_timer(time_left)

func spawn_coins():
	for i in level + 4:
		var c = coin_scene.instantiate()
		var pos = Vector2.ZERO
		var valid_position = false
		var attempts = 0
		while not valid_position and attempts < 100:
			pos = Vector2(
				randf_range(30, screensize.x - 30),
				randf_range(30, screensize.y - 30)
			)
			valid_position = true
			
			for obstacle in get_tree().get_nodes_in_group("obstacles"):
				if pos.distance_to(obstacle.position) < 80:
					valid_position = false
					break
			attempts += 1
		if valid_position:
			c.position = pos
			c.screensize = screensize
			add_child(c)
		else:
			c.queue_free()
	$LevelSound.play()


func spawn_obstacles():
	for i in level:
		var o = obstacle_scene.instantiate()
		var pos = Vector2.ZERO
		var valid_position = false
		var attempts = 0
		
		while not valid_position and attempts < 100:
			pos = Vector2(
				randf_range(30, screensize.x - 30),
				randf_range(30, screensize.y - 30)
			)
			valid_position = true
			if pos.distance_to($Player.position) < 100:
				valid_position = false
			for coin in get_tree().get_nodes_in_group("coins"):
				if pos.distance_to(coin.position) < 60:
					valid_position = false
					break
			attempts += 1
		if valid_position:
			o.position = pos
			add_child(o)
		else:
			o.queue_free()

func _process(_delta):
	if playing and get_tree().get_nodes_in_group("coins").size() == 0:
		level += 1
		time_left += 5
		spawn_coins()
		spawn_obstacles()
		$PowerupTimer.start(randf_range(5, 10))


func _on_game_timer_timeout() -> void:
	time_left -= 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		game_over()


func _on_player_hurt() -> void:
	game_over()



func _on_player_pickup(type):
	match type:
		"coin":
			$CoinSound.play()
			score += 1
			$HUD.update_score(score)

		"powerup":
			$PowerupSound.play()
			time_left += 5
			$HUD.update_timer(time_left)



func game_over():
	playing = false
	$GameTimer.stop()
	$PowerupTimer.stop()
	get_tree().call_group("coins", "queue_free")
	get_tree().call_group("obstacles", "queue_free")
	get_tree().call_group("powerups", "queue_free")
	$HUD.show_game_over()
	$Player.die()
	$EndSound.play()


func _on_hud_start_game() -> void:
	new_game()


func _on_powerup_timer_timeout() -> void:
	var p = powerup_scene.instantiate()
	add_child(p)
	p.screensize = screensize
	p.position = Vector2(
		randi_range(0, int(screensize.x)),
		randi_range(0, int(screensize.y))
	)
