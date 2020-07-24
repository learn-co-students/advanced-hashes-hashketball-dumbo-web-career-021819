# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors =>['Black', 'White'],
      :players => {
        'Alan Anderson' =>{
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        'Reggie Evans' => {
          :number =>30,
          :shoe =>14,
          :points =>12,
          :rebounds =>12,
          :assists =>12,
          :steals =>12,
          :blocks =>12,
          :slam_dunks =>7
        },
        'Brook Lopez' => {
          :number =>11,
          :shoe =>17,
          :points =>17,
          :rebounds =>19,
          :assists =>10,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>15
        },
        'Mason Plumlee' => {
          :number =>1,
          :shoe =>19,
          :points =>26,
          :rebounds =>12,
          :assists =>6,
          :steals =>3,
          :blocks =>8,
          :slam_dunks =>5
        },
        'Jason Terry' => {
          :number =>31,
          :shoe =>15,
          :points =>19,
          :rebounds =>2,
          :assists =>2,
          :steals =>4,
          :blocks =>11,
          :slam_dunks =>1
        }

      }

    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'Purple'],
      :players => {
      'Jeff Adrien' =>{
        :number =>4,
        :shoe =>18,
        :points =>10,
        :rebounds =>1,
        :assists =>1,
        :steals =>2,
        :blocks =>7,
        :slam_dunks =>2
      },
      'Bismak Biyombo' =>{
        :number =>0,
        :shoe =>16,
        :points =>12,
        :rebounds =>4,
        :assists =>7,
        :steals =>7,
        :blocks =>15,
        :slam_dunks =>10
      },
      'DeSagna Diop' =>{
        :number =>2,
        :shoe =>14,
        :points =>24,
        :rebounds =>12,
        :assists =>12,
        :steals =>4,
        :blocks =>5,
        :slam_dunks =>5
      },
      'Ben Gordon' =>{
        :number =>8,
        :shoe =>15,
        :points =>33,
        :rebounds =>3,
        :assists =>2,
        :steals =>1,
        :blocks =>1,
        :slam_dunks =>0
      },
      'Brendan Haywood' =>{
        :number =>33,
        :shoe =>15,
        :points =>6,
        :rebounds =>12,
        :assists =>12,
        :steals =>22,
        :blocks =>5,
        :slam_dunks =>12
      }
      }
    }

  }
  game_hash
end

def num_points_scored(players_name)
  #begin terate through first layer of hash
game_hash.each do |team,attribute|
  attribute.each do |opt1, opt2|
    #find the option that has players
    if opt1 == :players
      opt2.each do |name,attribute|
        #returns the name of player defined in the function argument
        if name == players_name
        #print "#{name}: "
        attribute.each do |result,value|
          #finds the amount of points associated with player name
          if result == :points
            return value
            #uses a return to end the function once the value is found for the players points

          end
        end
      end
    end
  end
end
end
end
#puts num_points_scored('Brendan Haywood')

def shoe_size(players_name)
  game_hash.each do |team,attribute|
    attribute.each do |opt1, opt2|
      if opt1 == :players
        opt2.each do |name,attribute|
          if name == players_name
            #finds players name as stated in function arguments
          #print "#{name}: "
          attribute.each do |result,value|
            if result == :shoe
              #returns the shoesize of the player
              return value

            end
          end
        end
      end
    end
  end
  end
  end
#Build a method, team_colors, that takes in an argument of the team name and returns an array of that teams colors.

def team_colors(teamname)
if game_hash[:home][:team_name] == teamname
  #returns the arrar if team_name matches teamname
  game_hash[:home][:colors]
elsif game_hash[:away][:team_name] == teamname
  game_hash[:away][:colors]
end
end

#Build a method, team_names, that operates on the game hash to return an array of the team names.
def team_names
  arrayOfTeamNames = [] #initialize new hash
  arrayOfTeamNames << game_hash[:home][:team_name]
  arrayOfTeamNames << game_hash[:away][:team_name] #shovel it with the data
end

#Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.
def player_numbers(teamname)
  outArray = []
  if game_hash[:home][:team_name] == teamname
    game_hash[:home][:players].each do |k,v|
      #puts "#{k} TEST #{v}"
      v.each do |result,number|
        if result == :number
          outArray << number
        end
      end
    end
    outArray

  elsif game_hash[:away][:team_name] == teamname
    game_hash[:away][:players].each do |k,v|
      #puts "#{k} TEST #{v}"
      v.each do |result,number|
        if result == :number
          outArray << number
        end
      end
    end
    outArray
end
end
#Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(playername)

if game_hash[:away][:players][playername]
  game_hash[:away][:players][playername]
else
  game_hash[:home][:players][playername]

end
end

#Build a method, big_shoe_rebounds, that will return the number of rebounds associated with the player that has
#the largest shoe size. Break this one down into steps:

#First, find the player with the largest shoe size
#Then, return that player's number of rebounds
#Remember to think about return values here.
#Use binding.pry to drop into your method and understand what it is returning and why.

def big_shoe_rebounds
  shoe_size =0 #creates a lowest size shoe_size
  rebounds = 0
game_hash[:home][:players].each do |player,attribute_hash|
  if attribute_hash[:shoe] > shoe_size #every shoe_size that is bigger than the last will overwrite the array.
    shoe_size = attribute_hash[:shoe]
    rebounds  = attribute_hash[:rebounds]
  end
end
#repeat process for the away side of the hash
game_hash[:away][:players].each do |player,attribute_hash|
      if attribute_hash[:shoe] > shoe_size
        shoe_size = attribute_hash[:shoe]
        rebounds  = attribute_hash[:rebounds]
end
end
rebounds
end

#puts big_shoe_rebounds
