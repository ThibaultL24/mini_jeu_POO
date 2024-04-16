require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'Iron Thib's Tournament 2' !    |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Bienvenue, héros, quel est ton nom ?"
print "> "
player_name = gets.chomp

my_game = Game.new(player_name)

puts "Présentons les combattants !!"

while my_game.is_still_ongoing?
  puts "Voici l'état de chaque joueur :"
  my_game.show_players

  puts ""
  puts "Fiiiiiight !"
  puts ""

  # Menu
  puts "Que veux-tu faire ?"
  puts "a - Chercher une arme"
  puts "s - Chercher un pack de soin"
  my_game.enemies.each_with_index do |enemy, index|
    puts "#{index} - Attaquer l'ennemi #{index + 1}"
  end
  print " > "
  choice = gets.chomp

  my_game.menu(choice)

  my_game.enemies_attack
end

my_game.game_end