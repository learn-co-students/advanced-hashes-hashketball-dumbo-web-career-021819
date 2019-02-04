require 'pry'

def game_hash 
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson': {
          :number => 0,
          :shoe => 16 ,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        'Reggie Evans': {          
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        'Brook Lopez': {          
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        'Mason Plumlee': {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        'Jason Terry': {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien': {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        'Bismak Biyombo': {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        'DeSagna Diop': {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        'Ben Gordon': {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        'Brendan Haywood': {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#...need game_hash[:home][:team_info][:players][:stats]
def num_points_scored(player_name)
  game_hash.each { |location, team_info|
    team_info[:players].each { |players, stats|
      if players.to_s == player_name
        return stats[:points]
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each { |location, team_info|
    team_info[:players].each { |players, stats|
      if players.to_s == player_name
        return stats[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |location, team_info|
    if team_info[:team_name].to_s == team_name
      return team_info[:colors]
    end
  }
end

def team_names
  finalArr = []
  game_hash.each { |location, team_info|
    finalArr.push(team_info[:team_name].to_s)
  }
  return finalArr
end

def player_numbers(team_name)
  finalArr = []
  game_hash.each {|location, team_info|
    if team_info[:team_name].to_s == team_name
      team_info[:players].each { |players, stats|
        finalArr.push(stats[:number])
      }
    end
  }
  return finalArr
end

def player_stats(player_name)
  game_hash.each { |location, team_info| 
    team_info[:players].each { |players, stats|
      if players.to_s == player_name
        return stats
      end
    }
  }
end

def big_shoe_rebounds
  biggest_feet = ''
  biggest_size = 0
  game_hash.each {|location, team_info|
    team_info[:players].each { |players, stats|
      if stats[:shoe].to_i > biggest_size
        biggest_feet = players.to_s
      end
    }
  }
  
  game_hash.each {|location, team_info|
    team_info[:players].each {|players, stats|
      if players.to_s == biggest_feet
        return stats[:rebounds]
      end
    }
  }
end

#bonus

def most_points_scored
  most_points = ''
  highest_score = 0
  game_hash.each { |location, team_info|
    team_info[:players].each { |players, stats|
      if stats[:points].to_i > highest_score
        highest_score = stats[:points]
        most_points = players.to_s
      end
    }
  }
  
  return most_points
end

def winning_team
  highest_score = 0
  better_team = ''
  
  game_hash.each { |location, team_info|
    team_points = 0
    
    team_info[:players].each { |players, stats|
      team_points += stats[:points]
    }
    
    if team_points > highest_score
      highest_score = team_points
      better_team = team_info[:team_name]
    end
  }
  
  return better_team
end

def player_with_longest_name
  longest_name = ''
  length = 0
  
  game_hash.each { |location, team_info|
    team_info[:players].each { |player, stats|
      if player.to_s.length > length
        length = player.to_s.length
        longest_name = player.to_s
      end
    }
  }
  
  return longest_name
end

#super bonus
def long_name_steals_a_ton?
  longest = player_with_longest_name
  most_steals = ''
  steal_score = 0
  
  game_hash.each { |location, team_info|
    team_info[:players].each { |players, stats|
      if stats[:steals].to_i > steal_score
        steal_score = stats[:steals]
        most_steals = players.to_s
      end
    }
  }
  
  return longest == most_steals
end
