class Game
    attr_accessor :human_player, :enemies
  
    def initialize(player_name)
      @human_player = HumanPlayer.new(player_name)
      @enemies = []
      4.times { |i| @enemies << Player.new("Player#{i+1}") }
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.life_points > 0 && !@enemies.empty?
    end
  
    def show_players
      @human_player.show_state
      puts "Il reste #{@enemies.length}"
    end
  
    def menu(choice)
      case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      when "1"
        @human_player.attacks(@enemies[0])
        kill_player(@enemies[0]) if @enemies[0].life_points <= 0
      when "2"
        @human_player.attacks(@enemies[1])
        kill_player(@enemies[1]) if @enemies[1].life_points <= 0
      when "3"
        @human_player.attacks(@enemies[2])
        kill_player(@enemies[2]) if @enemies[2].life_points <= 0
      when "4"
        @human_player.attacks(@enemies[3])
        kill-player(@enemies[3]) if @enemies[2].life_points <= 0
      else
        puts "Commande invalide!"
      end
    end
  
    def enemies_attack
      @enemies.each do |enemy|
        enemy.attacks(@human_player) if enemy.life_points > 0
      end
    end
  
    def game_end
      if @human_player.life_points <= 0
        puts "#{human_player.name} a été vaincu ! Les ennemis remportent ce combat !"
      elsif @enemies.empty?
        puts "les ennemis ont été vaincu ! #{human_player.name} remporte ce combat !"
      end
    end
  end