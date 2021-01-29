require 'colorize'
# 6 rooms (movement between should mirror the shape of "6"—top-right can only go west, top-left can only go east and south, etc).
# 3 items (that can be picked up/put down; show inventory)
# 2 monsters (can be attacked/die)
# start in random room,	
# should see room description (available movement), room items, monsters after each action
# end state I'll leave to you
class Player
    attr_accessor :hitpoints, :attack
    def initialize
        @hitpoints = 20
        @attack = 1
    end
    def is_alive
        @hitpoints > 0
    end
end
class Library
end
class Hallway
end
class Armory
end
class Study
end
class Cellar
end
class Dungeon
end
class Goblin
end
class Troll
end


puts"THE GAME IS SIMPLE, INPUT THE LETTER OF YOUR CHOICE.".blue
sleep 3
puts"You open your eyes and see you are in a large, dark room. There is barely enough light to see. What do you do?"
sleep 3
puts"A:Feel your way around the room. B:Start screaming for help. C:Meditate".red
first_move = gets.chomp.upcase
if first_move == 'B'
    puts"You scream as loud as you can. Nothing happens, but now your throat is dry and you are still in the same spot you woke up in."
    sleep 3
    puts"What do you do now?"
    sleep 1
    puts"A:Feel your way around the room. B:Meditate".red
    first_move = gets.chomp.upcase
    if first_move == "B"
        first_move = "C"
    end
end
if first_move == "C"
    puts"You cross your legs and clear your mind of all other worldy matters. You do not fear death, you do not fear life."
    sleep 3
    puts"..."
    sleep 1
    puts"..."
    sleep 1
    puts"..."
    sleep 1
    puts"..."
    sleep 3
    puts"You have no idea how much time has passed, but you know you are close to enlightenment."
    sleep 3
    puts"What do you do?"
    puts"A:Feel your way around the room. B:Meditate More".red
    first_move = gets.chomp.upcase
    if first_move == "B"
        puts"You cross your legs again and clear your mind of all other worldy matters. You do not fear death, you do not fear life."
            sleep 3
            puts"..."
            sleep 1
            puts"..."
            sleep 1
            puts"..."
            sleep 1
            puts"..."
            sleep 1
            puts"..."
            sleep 1
            puts"..."
            sleep 1
            puts"..."
            sleep 3
            puts "You have reached enlightenment..."
            sleep 4
            puts "You try to stand up and you feel your legs feel weak beneath you. 'How long has it been since I've eaten you think to yourself?' As you go to take a step your legs crumble beneath you, you don't have the strength to walk."
            sleep 8
            puts "Your face smashes against the cold stone on the ground"
            sleep 2
            puts "Everything around you is growing dark..."
            sleep 4
            puts"This is the end"
            sleep 2
            puts ".........."
            puts ""
            puts "GAME OVER"
    end
end
if first_move == "A"
    outcome = rand(3) + 1
    if outcome == 1
        puts"You find a rusty sword on the ground next to large wooden door. A cold breeze is rolling through the door. You pick up the sword and proceed through the door."
        @attack = 5
    elsif outcome == 2
        puts"You run your fingers along the wall of what seems to be a large circular room until you find a large wooden door. The air seeping through the cracked door is freezing cold. You pull the door open and walk through."
    elsif outcome == 3
        puts"You feel your way through a large room. You spot a large wooden door and make your way toward it. As you do, your foot catches on a loose stone and you fall flat onto your face. You lose 5 health. You feel blood begin to run down your nose. Embarrassed, dusty, and a tad bloody you proceed through the large wooden door."
        @hitpoints = 15
    end
end


