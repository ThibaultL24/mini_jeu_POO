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
  puts "0 - Attaquer l'ennemi 1"
  puts "1 - Attaquer l'ennemi 2"
  puts "2 - Attaquer l'ennemi 3"
  puts "3 - Attaquer l'ennemi 4"
  print " > "
  choice = gets.chomp

  my_game.menu(choice)

  my_game.enemies_attack
end

my_game.game_end