def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
          :name => [ "Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"],
          :number =>    [0, 30,11,1,31],
          :shoe =>      [16,14,17,19,15],
          :points =>    [22,12,17,26,19],
          :rebounds =>  [12,12,19,12,2],
          :assists =>   [12,12,10,6, 2],
          :steals =>    [3, 12,3, 3, 4],
          :blocks =>    [1, 12,1, 8,11],
          :slam_dunks =>[1, 7,15, 5, 1]
        }
        
def player_stats(player_name)
  stat_hash = {}
  i = 0
  while i < game_hash[:home][:players][:name].length
    if player_name == game_hash[:home][:players][:name][i]
      stat_hash = {
        :number => game_hash[:home][:players][:number][i],
        :shoe => game_hash[:home][:players][:shoe][i],
        :points => game_hash[:home][:players][:points][i],
        :rebounds => game_hash[:home][:players][:rebounds][i],
        :assists => game_hash[:home][:players][:assists][i],
        :steals => game_hash[:home][:players][:steals][i],
        :blocks => game_hash[:home][:players][:blocks][i],
        :slam_dunks => game_hash[:home][:players][:slam_dunks][i]
      }
    elsif player_name == game_hash[:away][:players][:name][i]
      stat_hash = {
        :number => game_hash[:away][:players][:number][i],
        :shoe => game_hash[:away][:players][:shoe][i],
        :points => game_hash[:away][:players][:points][i],
        :rebounds => game_hash[:away][:players][:rebounds][i],
        :assists => game_hash[:away][:players][:assists][i],
        :steals => game_hash[:away][:players][:steals][i],
        :blocks => game_hash[:away][:players][:blocks][i],
        :slam_dunks => game_hash[:away][:players][:slam_dunks][i]
      }
    end
    i += 1
  end
  stat_hash
end









