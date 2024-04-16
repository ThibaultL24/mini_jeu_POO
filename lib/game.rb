class Game
    attr_accessor :human_player, :enemies
  
    def initialize(player_name)
      @human_player = HumanPlayer.new(player_name)
      @enemies = []
      4.times do |i|
        @enemies << Player.new("Player#{i + 1}")
      end
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.life_points > 0 && !@enemies.empty?
    end
  
    def show_players
      @human_player.show_state
      puts "Il reste #{remaining_enemies_count} ennemis."
    end
  
    def menu(choice)
        case choice
        when "a"
          @human_player.search_weapon
        when "s"
          @human_player.search_health_pack
        when "0", "1", "2", "3"
          enemy_id = choice.to_i
          if enemy_id < @enemies.size
            enemy = @enemies[enemy_id]
            if enemy.life_points > 0
              @human_player.attacks(enemy)
              kill_player(enemy) if enemy.life_points <= 0
            else
              puts "#{enemy.name} est déjà éliminé !"
            end
          else
            puts "Cet ennemi n'existe pas!"
          end
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
        puts "les ennemis ont été vaincus ! #{human_player.name} remporte ce combat !"
      end
    end
  
    private
  
    def remaining_enemies_count
      count = 0
      @enemies.each { |enemy| count += 1 if enemy.life_points > 0 }
      count
    end
  end