#murray state
murray_state_ids <- get_game_ids("Murray State")

murray_southern <- murray_state_ids[1]
murray_southern

murray_state_color <- "Black"

murray_season_ass <- assist_net("Murray State", season = "2019-20", node_col = murray_state_color)

murray_southern_ass_net <- assist_net("Murray State", season = murray_southern, node_col = murray_state_color)

murrary_southern_shot <- game_shot_chart(game_id = murray_southern, heatmap = FALSE)
    ##no shot location data for this game

#washington
#alabama state
#chattanooga
#florida state
#purdue or vcu
#florida a&m
#memphis
#cincinnati
#jacksonville state
#wisconsin
#lsu
#missouri
#south carolina
#georgia
#vanderbilt
#ole miss
#kansas
#texas a&m
#mississippi state
#alabama
#kentucky
#arkansas
#south carolina
#vanderbilt
#arkansas
#florida
#kentucky
#auburn
