require 'pry'
# Write your code here!
def game_hash
  {
  :home=>{
  :team_name=>"Brooklyn Nets",
  :colors=>["Black", "White"],
  :players => {
      "Alan Anderson"=>{
        :number=> 0,
        :shoe=> 16,
        :points=> 22,
        :rebounds => 12,
        :assists=> 12,
        :steals=> 3,
        :blocks=> 1,
        :slam_dunks=> 1
      },
      "Reggie Evans"=>{
        :number=> 30,
        :shoe=> 14,
        :points=> 12,
        :rebounds => 12,
        :assists=> 12,
        :steals=> 12,
        :blocks=> 12,
        :slam_dunks=> 7
      },
      "Brook Lopez"=>{
        :number=> 11,
        :shoe=> 17,
        :points=> 17,
        :rebounds => 19,
        :assists=> 10,
        :steals=> 3,
        :blocks=> 1,
        :slam_dunks=> 15
      },
      "Mason Plumlee"=>{
        :number=> 1,
        :shoe=> 19,
        :points=> 26,
        :rebounds => 12,
        :assists=> 6,
        :steals=> 3,
        :blocks=> 8,
        :slam_dunks=> 5
      },
      "Jason Terry"=>{
        :number=> 31,
        :shoe=> 15,
        :points=> 19,
        :rebounds => 2,
        :assists=> 2,
        :steals=> 4,
        :blocks=> 11,
        :slam_dunks=> 1
      }
    }
  },

:away=>{
  :team_name=>"Charlotte Hornets",
  :colors=>["Turquoise", "Purple"],
  :players => {
      "Jeff Adrien"=>{
        :number=> 4,
        :shoe=> 18,
        :points=> 10,
        :rebounds => 1,
        :assists=> 1,
        :steals=> 2,
        :blocks=> 7,
        :slam_dunks=> 2
      },
      "Bismak Biyombo"=>{
        :number=> 0,
        :shoe=> 16,
        :points=> 12,
        :rebounds => 4,
        :assists=> 7,
        :steals=> 7,
        :blocks=> 15,
        :slam_dunks=> 10
      },
      "DeSagna Diop"=>{
        :number=> 2,
        :shoe=> 14,
        :points=>24,
        :rebounds => 12,
        :assists=> 12,
        :steals=> 4,
        :blocks=> 5,
        :slam_dunks=> 5
            },
      "Ben Gordon"=>{
        :number=> 8,
        :shoe=> 15,
        :points=> 33,
        :rebounds => 3,
        :assists=> 2,
        :steals=> 1,
        :blocks=> 1,
        :slam_dunks=> 0
      },
      "Brendan Haywood"=>{
        :number=> 33,
        :shoe=> 15,
        :points=> 6,
        :rebounds => 12,
        :assists=> 12,
        :steals=> 22,
        :blocks=> 5,
        :slam_dunks=> 12
      }
    }
  }
}
end

def num_points_scored(players_name)
  array = []
  game_hash.each do |teams, data|
    data.each do |attributes, input|
      if attributes == :players
      input.each do |name, stats|
        stats.each do |details, value|
          if name == players_name && details == :points
            array << value
          end
        end
      end
    end
  end
end
  array[0]
end

def shoe_size(players_name)
  array=[]
  game_hash.each do |teams, data|
    data.each do |attributes, input|
      if attributes == :players
      input.each do |name, stats|
        stats.each do |details, value|
          if name == players_name && details == :shoe
            array << value
          end
        end
      end
    end
  end
end
  array[0]
end

def team_colors(team_name)
  array=[]
  game_hash.each do |teams, data|
    if data[:team_name] == team_name
      array = data[:colors]
  end
end
  array
end

def team_names
  array=[]
    game_hash.each do |teams, data|
      data.each do |attributes, input|
        if attributes == :team_name
          array << input
    end
  end
end
  array
end

def player_numbers(team_name)
    array=[]
    game_hash.each do |teams, data|
      data.each do |attributes, input|
        if attributes == :players
        input.each do |name, stats|
          if data[:team_name] == team_name
              array << stats[:number]
            end
          end
        end
      end
    end
    array
  end

def player_stats(players_name)
  hash=''
  game_hash.each do |teams, data|
    data.each do |attributes, input|
      if attributes == :players
      input.each do |name, stats|
          if name == players_name
            hash = stats
          end
        end
      end
    end
  end
  hash
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |teams, data|
    data.each do |attributes, input|
      if attributes == :players
      input.each do |name, stats|
        stats.each do |details, value|
        if details = :shoe && value > shoe
          rebounds = stats[:rebounds]
        end
      end
    end
  end
end
end
return rebounds
end
