library(tidyverse)
library(ncaahoopR)

ut_game_ids <- get_game_ids("Tennessee")
head(ut_game_ids)

View(dict)
View(ncaa_colors)


ut_color_primary <- ncaa_colors %>%
  filter(ncaa_name == "Tennessee") %>%
  select(primary_color)

ut_color_secondary <- ncaa_colors %>%
  filter(ncaa_name == "Tennessee") %>%
  select(secondary_color)

###unca doesn't have colors listed
unca_color_primary <- ncaa_colors %>%
  filter(ncaa_name == "UNC Asheville") %>%
  select(primary_color)

unca_color_primary <- "Black"

ut_unca_game_id <- ut_game_ids[1]

ut_unca_game_id

ut_color_primary

ut_unca_wp <- wp_chart(ut_unca_game_id, ut_color_primary$primary_color, unca_color_primary, show_legend = T)

gg_ut_unca_wp <- gg_wp_chart(ut_unca_game_id, ut_color_primary$primary_color, unca_color_primary, show_labels = T)

ut_unca_game_flow <- game_flow(ut_unca_game_id, ut_color_primary$primary_color, unca_color_primary)

ut_unca_game_flow

ut_unca_game_ex <- game_excitement_index(ut_unca_game_id)

ut_unca_game_ex

average_win_prob(ut_unca_game_id)

ut_unca_assist_TENNESSEE <- assist_net(team = "Tennessee", node_col = ut_color_primary$primary_color, season = ut_unca_game_id)

ut_unca_assist_UNCA <- assist_net(team = "UNC Asheville", node_col = "Black", season = ut_unca_game_id)

ut_unca_heat_map <- game_shot_chart(game_id = ut_unca_game_id, heatmap = TRUE)

ut_unca_shot_chart <- game_shot_chart(game_id = ut_unca_game_id, heatmap = FALSE)


###murray state###

ut_ms_game_id<- ut_game_ids[2]

ut_ms_game_id

ut_color <- ut_color_primary$primary_color
  
  ##wp chart##

    ut_ms_wp <- wp_chart(ut_ms_game_id, ut_color_primary$primary_color, murray_state_color, show_legend = T)
  
  ##game flow##
    
    ut_ms_gf <- game_flow(ut_ms_game_id, ut_color, murray_state_color)
    
    ut_ms_gf    
  
  ##assist net ut##
    
    ut_ms_ass_net <- assist_net(team = "Tennessee", node_col = ut_color, season = ut_ms_game_id)
  
    ut_ms_ass_net
    
  ##assist net ms##
    
    ms_ass_net <- assist_net(team = "Murray State", node_col = murray_state_color, season = ut_ms_game_id)
    
  ##shot maps##
    
    ut_ms_heat_map <- game_shot_chart(ut_ms_game_id, heatmap = T)

    get_shot_locs(ut_ms_game_id)    

    ##no shot location available for this game###
    
###washington###
    
