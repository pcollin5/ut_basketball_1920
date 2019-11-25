duke_game_id <- get_game_ids("Duke")

duke_kansas_id <- duke_game_id[1]

duke_kansas_id

game_shot_chart(duke_kansas_id, heatmap = TRUE)
