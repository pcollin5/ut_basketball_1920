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
    
    washington_col <- ncaa_colors %>%
      filter(ncaa_name == "Washington") %>% 
      select(primary_color)
    
    washington_color <- washington_col$primary_color      

    washington_color
    
    washington_game_ids <- get_game_ids("Washington")
    
    washington_season_ass_net <- assist_net(team = "Washington", node_col = washington_color, season = "2019-20")
    
    ?game_shot_chart
    get_shot_locs(washington_game_ids[1])
    
    washington_baylor_heat_map <- game_shot_chart(washington_game_ids[1], heatmap = T)
    
    washington_baylor_heat_map  
        
        ###this data is wonky###
    
    
    game_shot_chart(washington_game_ids[2], heatmap = T)

    
    ut_wash_id <- ut_game_ids[3]
    
    ut_wash_id
    
    us_wash_wp <- wp_chart(ut_wash_id, ut_color, washington_color, show_legend = TRUE)
    
    ut_wash_gf <- game_flow(ut_wash_id, ut_color, washington_color)
    
    ut_wash_gf
    
    ut_wash_ass_net_UT <- assist_net(team = "Tennessee", node_col = ut_color, season = ut_wash_id)
    
    ut_wash_ass_net_WASH <- assist_net(team = "Washington", node_col = washington_color, season = ut_wash_id)
    
    ut_wash_heat_map <- game_shot_chart(ut_wash_id, heatmap = TRUE)
    
    get_shot_locs(ut_wash_id)
    ###no shot location data
    
    
    
    ###next is alabama state 11/20/2019
        
        ##opponent ids
    
          bamast_id <- get_game_ids(team = "Alabama State")
        
        ##opponent color
          
          bamast_color <- "Gold"
        
        ##opponent season ass net
        
          bamast_ass_net_season <- assist_net(team = "Alabama State", node_col = bamast_color, season = "2019-20")
            #TRY LATER ESPN IS STILL UPDATING
          
        ##opponent ass net previous game
          
          bamast_previous_game <- assist_net(team = "Alabama State", node_col = bamast_color, season = bamast_id[3])
          
        ##opponent heat map previous game
          
          ##nope
          
        ##win prob
          
          ut_bamast_id <- ut_game_ids[4]
          
          ut_bamast_wp <- wp_chart(ut_bamast_id, home_col = ut_color, away_col = bamast_color)
          
        ##game flow
          
          ut_bamast_gf <- game_flow(ut_bamast_id, home_col = ut_color, away_col = bamast_color)
          
          ut_bamast_gf
          
        ##ut ass net
          
          ut_bamast_assnet_ut <- assist_net(team = "Tennessee", season = ut_bamast_id, node_col = ut_color)
        
        ##opponent ass net
          
          ut_bamast_assnet_bamast <- assist_net(team = "Alabama State", season = ut_bamast_id, node_col = bamast_color)
          
        ##heat map
          
          get_shot_locs(ut_bamast_id)
          ###no shot location available
          
        ##update ut season ass net
    
    
    
    ###next game: CHATTANOOGA AT HOME
          
        ##opponent ids
          
          chattanooga_ids <- get_game_ids("Chattanooga")
          
        ##opponent color
          
          #color not in df
          
          utc_color <- "Gold"
          
        ##opponent season ass net
          
          utc_season_assnet <- assist_net(team = "Chattanooga", season = "2019-20", node_col = "Gold")
          
        ##opponent ass net previous game
          
          utc_fsu_id <- chattanooga_ids[5]
          
          utc_fsu_assnet_utc <- assist_net(team = "Chattanooga", season = utc_fsu_id, node_col = utc_color)
          
        ##opponent heat map previous game
          
          utc_fsu_heat_map <- game_shot_chart(utc_fsu_id)
          
          ##no shot location 
        
        ##win prob
          
          ut_utc_id <- ut_game_ids[5]
          
        ##game flow
        ##ut ass net
        ##opponent ass net
        ##heat map
        ##update ut season ass net
        
   
    ###next game:
        ##opponent ids
        ##opponent color
        ##opponent season ass net
        ##opponent ass net previous game
        ##opponent heat map previous game
        ##win prob
        ##game flow
        ##ut ass net
        ##opponent ass net
        ##heat map
        ##update ut season ass net
