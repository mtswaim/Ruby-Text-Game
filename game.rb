require 'colorize'
# 6 rooms (movement between should mirror the shape of "6"—top-right can only go west, top-left can only go east and south, etc).
# 3 items (that can be picked up/put down; show inventory)
# 2 monsters (can be attacked/die)
# start in random room,	
# should see room description (available movement), room items, monsters after each action
# end state I'll leave to you
class Player
    attr_accessor :hitpoints, :attack, :inventory
    def initialize
        @hitpoints = 20
        @attack = 1
        @inventory = []
    end
    def is_alive
        @hitpoints > 0
    end
end
class Library
    def description
        puts "a large room filled with dark wooden bookcases that reach from the floor the ceiling. There is one door on the west wall."
    end
end
class Hallway
    def description
        puts "a vast empty corridor lined with stone pillars. A massive woodeen door lies partially open at the northern end. Light spills through the opening of the door."
    end
end
class Armory
    def description
        puts "a dark, cold room lined with stone. The walls are lined what used to be usable weapons and armor. Time has defeated them. There are doors on north and south walls."
    end
end
class Study
    def description
        puts "a warm, well lit room. This room is small, but invitiing. All the candles are lit and it appears someone spends a lot of time, or maybe spent a lot of time here. There are two doors, one on the north and one on the east wall."
    end
    def possible_directions
        puts "North or East"
    end
end
class Cellar
    def description
        puts "a cold, stone walled and floored room that obviously used to house food and drink. A long while seems to have passed since either of those could actually be found in the room though." 
        rest 4
        puts "a collection of hay rests in one corner, as if someone has been sleeping here."
        rest 3
        "There is a door on the north and south wall."
    end
end
class Dungeon
    def description
        puts "a cold, bleek room with a terrible stench. It is hard to see, but it what looks like prison cells line the northern and southern walls."
        rest 3
        puts "There is a door at the west and east end of the room."
    end
end
class Goblin
    def description
        puts ""
    end
end
class Troll
    def description
        puts ""
    end
end
class Sword
    attr_accessor :sword, :damage
    def initialize
        @sword
    end
    def swing_sword
        @damage = rand(10) + 1
    end
end
class Stick
    attr_accessor :stick, :damage
    def initialize
        @stick
    end
    def stick_swing
        @damage = rand(2) + 1
    end
end
class Potion < Player
    attr_accessor :potion, :hitpoints
    def initialize
        @potion
    end
    def drink_potion
        @hitpoints +=10
    end
end
class GameLoop
    attr_accessor :starting_room
    def initialize
        @player = Player.new
        @library = Library.new
        @armory = Armory.new
        @dungeon = Dungeon.new
        @cellar = Cellar.new
        @hallway = Hallway.new
        @study = Study.new
        @rooms = [@library, @armory, @dungeon, @cellar, @hallway, @study]
    end
    def choose_start_room
        @starting_room = @rooms[rand(6)]
    end
end

new_game = GameLoop.new
new_game.choose_start_room
puts"THE GAME IS SIMPLE, INPUT THE LETTER OF YOUR CHOICE.".blue
sleep 3
puts"You open your eyes and see #{new_game.starting_room.description}"



