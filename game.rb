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
        @ap = 1
        @inventory = []
    end
    def is_alive
        @hitpoints > 0
    end
end
class Monster
    def initialize
        @name = name
        @hitpoints = hitpoints
        @ap = ap
    end
    def attack
        rand(@ap) + 1
    end
    def is_alive
        @hitpoints > 0
    end
end
class Room
    attr_accessor :south_door, :north_door, :west_door, :north_door, :name, :description
    def initialize(name,description,south_door = false,north_door = false,west_door = false,east_door = false)
        @name = name
        @description = description
        @south_door
        @east_door 
        @west_door 
        @north_door 
    end
end
class Weapon
    def initialize
        @name = name
        @ap = ap
    end
    def attack
        rand(@ap) + 1
    end
end



@player = Player.new
@library = Room.new("Library", "a large room filled with dark wooden bookcases that reach from the floor the ceiling. There is one door on the west wall.",@west_door=true)
@hallway = Room.new("Hallway", "a vast empty corridor lined with stone pillars. A massive woodeen door lies partially open at the northern end. Light spills through the opening of the door.",@north_door=true , @east_door=true)
@armory = Room.new("Armory", "a dark, cold room lined with stone. The walls are lined what used to be usable weapons and armor. Time has defeated them. There are doors on north and south walls.",@north_door=true , @south_door=true)
@study = Room.new("Study", "a warm, well lit room. This room is small, but invitiing. All the candles are lit and it appears someone spends a lot of time, or maybe spent a lot of time here. There are two doors, one on the north and one on the east wall.",@west_door=true , @east_door=true)
@cellar = Room.new("Cellar", "a cold, stone walled and floored room that obviously used to house food and drink. A long while seems to have passed since either of those could actually be found in the room though.", @north_door=true, @south_door=true )
@dungeon = Room.new("Dungeon", "a cold, bleek room with a terrible stench. It is hard to see, but it what looks like prison cells line the northern and southern walls.", @west_door = true, @east_door = true)
@rooms = [@library, @armory, @dungeon, @cellar, @hallway, @study]
@current_room = rand(6)


puts"THE GAME IS SIMPLE, INPUT THE LETTER OF YOUR CHOICE.".blue
puts"You open your eyes and see ..."

puts "#{@rooms[@current_room].description}"


while true
    # Output room you are in
    # give options for room
    # take input for options
    # respond to input
    puts "What would you like to do"
    puts "A:Search the Room. B:Wait C: Exit the room"
    @choice = gets.chomp
    if @choice.upcase == "C"
        @current_room += 1
    end
    puts "#{@rooms[@current_room].description}"
    # move between rooms
end






































