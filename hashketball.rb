# first method generates a hash
def game_hash
    nba_hash = {
      home: {:team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {"Alan Anderson" => {:number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        "Reggie Evans" => {:number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {:number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {:number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {:number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
      }}},

      away: {:team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {"Jeff Adrien" => {:number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        "Bismak Biyombo" => {:number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {:number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {:number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {:number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
      }}}
    }
end

def num_points_scored(player_name)
game_hash.each do |key,value| # {:home, :away} => {:team_name,:colors,:players}
 value.each do |key2,value2| # {:team_name,:colors,:players} => value2
  if key2 == :players #true
   if value2.has_key?(player_name) #player_name =>
    value2.each do |key3,value3| #  {player_name => {stats,int}
     if key3 == player_name #player_name => {:number,:shoe,:points,:rebounds,:assists,:steals,:blocks,:slam_dunks
      value3.each do |stat,int| # {stat => int}
       if stat == :points # int
        return int
         end
        end
       end
      end
     end
    end
   end
  end
end

def shoe_size(player_name)
game_hash.each do |key,value|
 value.each do |key2,value2|
  if key2 == :players
   value2.each do |key3,value3|
    if key3 == player_name
     value3.each do|key4,value4|
      if key4 == :shoe
       return value4
        end
       end
      end
     end
    end
   end
  end
end

def team_colors(team_name)
 game_hash.each do |key,value|
  value.each do |key2,value2|
   if value2 == team_name
    value.each do |key3,value3|
     if key3 == :colors
      return value3
       end
      end
    end
   end
  end
end

def team_names
 new_array = []
  game_hash.each do |key,value|
   value.each do |key2,value2|
    if key2 == :team_name
     new_array << value2
      end
     end
    end
new_array
end

def player_numbers(team_name)
new_array = Array.new
 game_hash.each do |key,value|
  value.each do |key2,value2|
   if key2 == :team_name
    if value2 == team_name
     value.each do |key3,value3|
      if key3 == :players
       value3.each do |key4,value4|
        value4.each do |stats,ints|
         if stats == :number
          new_array << ints
           end
          end
         end
        end
       end
      end
     end
    end
   end
new_array
end

def player_stats(player_name)
game_hash.each do |key,value|
 value.each do |key2,value2|
  if key2 == :players
   value2.each do |key3,value3|
    if key3 == player_name
     return value3
      end
     end
    end
   end
  end
end

def get_biggest_stats(stats)
stat = 0
 game_hash.each do |key,value|
  value.each do |key2,value2|
   if key2 == :players
    value2.each do |key3,value3|
     value3.each do |key4,value4|
      if key4 == stats
       if value4 > stat
        stat = value4
         end
        end
       end
      end
     end
    end
   end
  stat
end

def big_shoe_rebounds()
shoe = get_biggest_stats(:shoe)
 game_hash.each do |key,value|
  value.each do |key2,value2|
   if key2 == :players
    value2.each do |key3,value3|
     value3.each do |key4,value4|
      if key4 == :shoe
       if value4 == shoe
        value3.each do |key5,value5|
         if key5 == :rebounds
          return value5
           end
          end
         end
        end
       end
      end
     end
    end
   end
end


# p big_shoe_rebounds()
