# Write your code here!
require 'pry'
def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: {
        'Alan Anderson' =>
          {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
        'Reggie Evans' =>
          {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
        'Brook Lopez' =>
          {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
        'Mason Plumlee' =>
          {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
        'Jason Terry' =>
          {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: {
        'Jeff Adrien' =>
          {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
        'Bismak Biyombo' =>
          {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
        'DeSagna Diop' =>
          {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
        'Ben Gordon' =>
          {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
        'Brendan Haywood' =>
          {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
      }
    }
  }
end

def num_points_scored(p_name)
  array = []
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, data|
        data.each do |k, v|
          array << v if person == p_name && k == :points
        end
      end
    end
  end
  array[0]
end

def shoe_size(p_name)
  array = []
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, data|
        data.each do |k, v|
          array << v if person == p_name && k == :shoe
        end
      end
    end
  end
  array[0]
end

def team_colors(t_name)
  colors = []
  game_hash.each do |_location, team_data|
    colors = team_data[:colors] if team_data[:team_name] == t_name
  end
  colors
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
end

def player_numbers(t_name)
  jersey = []
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |_person, data|
        jersey << data[:number] if team_data[:team_name] == t_name
      end
    end
  end
  jersey
end

# also works

# def player_numbers(t_name)
# jersey = []
# game_hash.each do |location, team_data|
# if game_hash[location][:team_name] == t_name
# team_data[:players].each do |name, stats|
# jersey << stats[:number]
# end
# end
# end
# jersey
# end

def player_stats(p_name)
  stats = ''
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, data|
        stats = data if person == p_name
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = ''
  rebounds = ''
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |_person, data|
        data.each do |k, _v|
          next unless k == :shoe

          if (shoe_size == '') || (data[:shoe] > shoe_size)
            shoe_size = data[:shoe]
            rebounds = data[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

# BONUS

def most_points_scored
  points = ''
  player = ''
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, data|
        data.each do |k, _v|
          next unless k == :points

          if (points == '') || (data[:points] > points)
            points = data[:points]
            player = person
          end
        end
      end
    end
  end
  player
end

def winning_team
  points = ''
  team_points = ''
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |_person, data|
        data.each do |k, v|
          next unless k == :points

          if (points == '') || (data[:points] > points)
            points = v + data[:points]
            team_points = team_data[:team_name]
          end
        end
      end
    end
  end
  team_points
end

def player_with_longest_name
  long_name = ''
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, _data|
        long_name = person if person.length > long_name.length
      end
    end
  end
  long_name
end

# S BONUS

def long_name_steals_a_ton?
  most_steals = ''
  steals = 0
  game_hash.each do |_location, team_data|
    team_data.each do |attribute, values|
      next unless attribute == :players

      values.each do |person, data|
        if data[:steals] > steals
          steals = data[:steals]
          most_steals = person
            end
      end
    end
  end
  most_steals == player_with_longest_name
end
