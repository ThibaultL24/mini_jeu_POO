class Player
    attr_accessor :name, :life_points
  
    def initialize(name)
      @name = name
      @life_points = 20
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie."
    end
  
    def gets_damage(damage)
      @life_points -= damage
      @life_points = 0 if @life_points < 0
      if @life_points <= 0
        puts "Le joueur #{@name} a été tué !"
      end
    end
  
    def attacks(enemies)
        puts "Le joueur #{@name} attaque le joueur #{enemies.name}."
        damage = compute_damage
        enemies.gets_damage(damage)
        puts "Il lui inflige #{damage} points de dommages."
      end
  
    def compute_damage
      rand(1..6)
    end
  end
  
  class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name)
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  
    def compute_damage
      rand(1..6) * @weapon_level
    end
  
    def search_weapon
      new_weapon_level = rand(1..6)
      puts "Oooh! Tu as trouvé une arme de niveau #{new_weapon_level}"
  
      if new_weapon_level > @weapon_level
        puts "Wooow, elle est trop bien, prends la!!"
        @weapon_level = new_weapon_level
      elsif @weapon_level == new_weapon_level
        puts "Boaf, c'est le même niveau..."
      else
        puts "C'est de la M~#rde, elle n'est pas mieux, on s'en fout"
      end
    end
  
    def search_health_pack
      dice_roll = rand(1..6)
      case dice_roll
      when 1
        puts "T'as rien trouvé..."
      when 2..5
        if @life_points + 50 <= 100
          @life_points += 50
        else
          @life_points = 100
        end
        puts "YEAAAH, tu as trouvé un pack de 50HP !"
      when 6
        if @life_points + 80 <= 100
          @life_points += 80
        else
          @life_points = 100
        end
        puts "WOOOAW, tu as trouvé un pack de 80HP !"
      end
    end
  end
  