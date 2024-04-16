require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "À ma droite 'Iron-Thib'"
player1 = Player.new("Iron Thib")
puts ""

puts "À ma gauche 'Random-Baltringue'"
player2 = Player.new("Random Baltringue")
puts ""

puts "Présentons les deux combattants !!"

while player1.life_points > 0 && player2.life_points > 0

puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state

puts ""
puts "Fiiiiiight !"
puts ""

player1.attacks(player2)
break if player2.life_points <= 0

player2.attacks(player1)
break if player1.life_points <= 0

puts "Fin du round"
puts ""
end

if player1.life_points <= 0
    puts "Iron-Thib a été vaincu ! Random-Baltringue remporte ce combat !"
elsif player2.life_points <= 0
    puts "Random Baltringue a été vaincu ! Iron-Thib remporte ce combat !"
end
