# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ['Black', 'White'],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'Purple'],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        }
      }
    }
  }
end


def num_points_scored (player_name)
  answer = nil
  
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |name, stats|
      if name == player_name
        answer = stats[:points]
      end
    end
  end
  answer
end


def shoe_size (player_name)
  answer = nil
  
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |name, stats|
      if name == player_name
        answer = stats[:shoe]
      end
    end
  end
  answer
end

def team_colors (team_name)
  new_array = []
  
  game_hash.each do |team, team_hash|
    team_hash.each do |key, value|
      
       if value == team_name
         new_array << game_hash[team][:colors]
        end
        
    end
  end
  new_array.flatten
end

def team_names
  new_array = []
  
  game_hash.each do |team, team_hash|
    new_array << game_hash[team][:team_name]
  end
  new_array
end


def player_numbers(team)
  new_array = []
  
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  else 
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  end
  new_array
end


def player_stats (player_name)
 all_stats = []
 
  game_hash.each do |team, team_hashes|
    team_hashes.each do |key, value|
      
      if key == :players
        
        value.each do |name, stats|
          
          if name == player_name
            all_stats = stats  
          end
          
        end # value.each end
      end
    end
  end
  all_stats
end





def big_shoe_rebounds
  
  rebounds = 0
  big_shoe = 0
  
  game_hash.each do |team, team_hashes|
    team_hashes[:players].each do |players, stats|
      
      if big_shoe < stats[:shoe]
        
        big_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
        #binding.pry
      end
      
    end
  end
  rebounds
end



#def big_shoe
  
#  game_hash.each do |team, team_hashes|
#    team_hashes[:players].each do |players, stats|
#     binding.pry
#    end
#  end
#end


#if value == :players
#        value.each do |player_name, stats|
#          stats.each do |stat_name, number| #stat_name is rebounds,shoe / number is the rebounds
#            
#              if stat_name == :shoe
#                if number > big_shoe
#                  big_shoe = number
#                  rebounds = stat_name[:rebounds]
#                end
#              end
#          end
#        end
#      end






               # rebounds = game_hash[home_or_away][:players][player_name][:rebounds]
