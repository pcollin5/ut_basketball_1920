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
          
          ut_utc_wp <- wp_chart(ut_utc_id, home_col = ut_color, away_col = utc_color)
          
        ##game flow
          
          ut_utc_gf <- game_flow(ut_utc_id, home_col = ut_color, away_col = utc_color )
          
          ut_utc_gf
          
        ##ut ass net
          
          ut_utc_assnet_ut <- assist_net(team = "Tennessee", season = ut_utc_id, node_col = ut_color)
          
        ##opponent ass net
          
          ut_utc_assnet_utc <- assist_net(team = "Chattanooga", season = ut_utc_id, node_col = utc_color)
          
        ##heat map
          
          ut_utc_heat_map <- game_shot_chart(ut_utc_id, heatmap = TRUE)
          
          ut_utc_heat_map
          
          ut_utc_shot_loc <- game_shot_chart(ut_utc_id, heatmap = FALSE)
        
          ut_utc_shot_loc  
          
        ##try something
          
          ut_utc_shot_locations <- get_shot_locs(ut_utc_id)
        
        ##update ut season ass net
        
          lt_plot <-ut_utc_shot_locations %>%
            filter(shooter == "Lamonte Turner")
          
          P_half_180 + geom_point(data = lt_plot,  aes(x = x, y = y, col = outcome))
          
          lt_plot
          
          head(ut_utc_shot_locations)
          
          ?game_shot_chart
          
    ###next game: fsu
        ##opponent ids
          fsu_ids <- get_game_ids("Florida State")
        
          ##opponent color
          
          fsu_color <- ncaa_colors %>%
            filter(espn_name == "Florida State")%>%
            select(primary_color)
          
          fsu_primary_color <- fsu_color$primary_color
          
        ##opponent season ass net
          
          fsu_season_assnet <- assist_net(team = "Florida State", season = "2019-20", node_col = fsu_primary_color)
          
        ##opponent ass net previous game
          
          fsu_chicago_state <- assist_net(team = "Florida State", season = fsu_ids[6], node_col = fsu_primary_color)
          
        ##opponent heat map previous game
          
          ut_fsu_id <- ut_game_ids[6]
          
        ##win prob
          
          ut_fsu_id <- ut_game_ids[6]
          
          ut_fsu_wp <- wp_chart(ut_fsu_id, home_col = ut_color, away_col = fsu_primary_color)
          
        ##game flow
          
          ut_fsu_gf <- game_flow(ut_fsu_id, home_col = ut_color, away_col = fsu_primary_color)
          
          ut_fsu_gf
          
        ##ut ass net
          
          ut_fsu_utassnet <- assist_net(team = "Tennessee", season = ut_fsu_id, node_col = ut_color)
          
        ##opponent ass net
          
          ut_fsu_fsu_assnet <- assist_net(team = "Florida State", season = ut_fsu_id, node_col = fsu_primary_color)
          
        ##heat map
          
          ut_fsu_heat_map <- game_shot_chart(ut_fsu_id, heatmap = TRUE)
          
          ut_fsu_shot_chart <- game_shot_chart(ut_fsu_id, heatmap = FALSE)
          
        ##update ut season ass net
          
          
          
    ###next game: vcu
          ##opponent ids
          
            vcu_ids <- get_game_ids(team = "VCU")
          
          ##opponent color
            
            vcu_color <- ncaa_colors %>%
              filter(espn_name == "VCU") %>%
              select(primary_color)
            
            vcu_primary_color <- vcu_color$primary_color
            
          ##opponent season ass net
            
            vcu_assnet <- assist_net(team = "VCU", season = "2019-20", node_col = vcu_primary_color)
            
          ##opponent ass net previous game
            
            vcu_purdue <- assist_net(team = "VCU", season = vcu_ids[6], node_col = vcu_primary_color)
            
          ##opponent heat map previous game
            
            vcu_purdue_heat <- game_shot_chart(vcu_ids[6])
            ##no data
            
          ##win prob
            
            ut_vcu_id <- ut_game_ids[7]
            
            ut_vcu_wp <- wp_chart(ut_vcu_id, home_col = vcu_primary_color,  away_col = ut_color)
            
          ##game flow
            
            ut_vcu_gf <- game_flow(ut_vcu_id, home_col = vcu_primary_color, away_col = ut_color)
            
            ut_vcu_gf
            
          ##ut ass net
            
            ut_vcu_utassnet <- assist_net(team = "Tennessee", season = ut_vcu_id, node_col = ut_color)
            
          ##opponent ass net
            
            ut_vcu_vcuassnet <- assist_net(team = "VCU", season = ut_vcu_id, node_col = vcu_primary_color)
            
          ##heat map
            
            ut_vcu_heatmap <- game_shot_chart(ut_vcu_id, heatmap = TRUE)
            ##no shot 
            
          ##update ut season ass net      
          
            
            
    ###next game:
            ut_fam_id <- ut_game_ids[8]
          ##opponent ids
            
            fam_ids <- get_game_ids("Florida A&M")
            
          ##opponent color
            
            fam_color <- "Green"
            
          ##opponent season ass net
            
            fam_ass_net <- assist_net(team = "Florida A&M", season = "2019-20", node_col = fam_color)
            
          ##opponent ass net previous game
            
            #skip 
            
          ##opponent heat map previous game
            
            #skip
            
          ##win prob
            
            ut_fam_wp <- wp_chart(ut_fam_id, home_col = ut_color, away_col = fam_color)
            
          ##game flow
            
            ut_fam_gf <- game_flow(ut_fam_id, home_col = ut_color, away_col = fam_color)
            
            ut_fam_gf
            
            
          ##ut ass net
            
            ut_fam_assnet_ut <- assist_net(team = "Tennessee", season = ut_fam_id, node_col = ut_color)
            
          ##opponent ass net
            
            ut_fam_assnet_fam <- assist_net(team = "Florida A&M", season = ut_fam_id, node_col = fam_color)
            
          ##heat map
            
            get_shot_locs(ut_fam_id)
            
            ut_fam_heat_map <- game_shot_chart(ut_fam_id, heatmap = TRUE)
            
            ut_fam_heat_map
            
            ut_fam_shot_chart <- game_shot_chart(ut_fam_id, heatmap = FALSE)
            
            ut_fam_shot_chart
            
            ?game_shot_chart
            
            ##update ut season ass net
            
            
            
            ###next game:
            ut_mem_id <- ut_game_ids[9]
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
            
            
            ###next game:
            ut_uc_id <- ut_game_ids[10]
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
            
            
            ###next game:
            ut_jsu_id <- ut_game_ids[11]
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
            
            
            ###next game:
            ut_wisc_id <- ut_game_ids[12]
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
            
            
            ###next game:
            ut_lsu_id <- ut_game_ids[13]
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
            
            
            ###next game:
            ut_miz_id <- ut_game_ids[14]
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
            
            
            ###next game:
            ut_sc_id <- ut_game_ids[15]
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
            
            
            ###next game:
            ut_uga_id <- ut_game_ids[16]
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
            
            ###next game:
            ut_vandy_id <- ut_game_ids[17]
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
            
            ###next game:
            ut_miss_id <- ut_game_ids[18]
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
            
            ###next game:
            ut_kan_id <- ut_game_ids[19]
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

            ###next game:
            ut_tam_id <- ut_game_ids[20]
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
            
            ###next game:
            ut_msst_id <- ut_game_ids[21]
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
            
            ###next game:
            ut_bama_id <- ut_game_ids[22]
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
            
            ###next game:
            ut_uk_id <- ut_game_ids[23]
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
            
            ###next game:
            ut_ark_id <- ut_game_ids[24]
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
            
            ###next game:
            ut_sc_id <- ut_game_ids[25]
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
            
            ###next game:
            ut_vandy_id2 <- ut_game_ids[26]
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
            
            ###next game:
            ut_aub_id <- ut_game_ids[27]
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
            
            ###next game:
            ut_ark_id2 <- ut_game_ids[28]
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
            
            ###next game:
            ut_fl_id2 <- ut_game_ids[29]
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
            
            ###next game:
            ut_uk_id2 <- ut_game_ids[30]
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
            
            ###next game:
            ut_aub_id2 <- ut_game_ids[31]
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
