require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'Iron Thib's Tournament' !    |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Bienvenue, héros, quel est ton nom ?"
print "> "
player_name = gets.chomp
player = HumanPlayer.new(player_name)

enemy1 = Player.new("Shlagos")
enemy2 = Player.new("Kassos")

enemies = [enemy1, enemy2]

puts "À ma droite '#{player_name}'"
puts ""

puts "À ma gauche, les célèbres frères LaLoose : 'Shlagoooos'"
puts ""

puts "Eeeet : 'Kassooooos'"
puts ""

puts "Présentons les combattants !!"

while player.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
  puts "Voici l'état de chaque joueur :"
  player.show_state
  enemy1.show_state
  enemy2.show_state

  puts ""
  puts "Fiiiiiight !"
  puts ""

  # Menu
  puts "Que veux-tu faire ?"
  puts "a - Chercher une arme"
  puts "s - Chercher un pack de soin"
  puts "0 - Attaquer Shlagos"
  puts "1 - Attaquer Kassos"
  print " > "
  choice = gets.chomp

  case choice
  when "a"
    player.search_weapon
  when "s"
    player.search_health_pack
  when "0"
    player.attacks(enemy1)
  when "1"
    player.attacks(enemy2)
  else
    puts "Commande invalide! Tu perds ton tour, et Toc!"
  end

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(player)
    end
  end

  if player.life_points <= 0
    puts "#{player_name} a été vaincu ! Les frères LaLoose remporte ce combat !"
  elsif enemy1.life_points <= 0 && enemy2.life_points <= 0
    puts "les frères LaLoose ont été vaincu ! #{player_name} remporte ce combat !"
end
end