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
        @hitpoints = 15
        @ap = 1
        @inventory = []
    end
    def is_alive
        @hitpoints > 0
    end
end
class Monster
    def initialize(name, hitpoints, ap)
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
    attr_accessor :name, :description, :searched
    def initialize(name, description)
        @name = name
        @description = description
        @searched = false
    end
    def has_weapon

    end
    def has_monster
    
    end
end
class Weapon
    def initialize(name, ap)
        @name = name
        @ap = ap
    end
    def attack
        rand(@ap) + 1
    end
end



@player = Player.new
@wooden_sword = Weapon.new("Wooden Sword", 4)
@steel_sword = Weapon.new("Steel Sword", 10)
@stick = Weapon.new("Stick", 2)
@goblin = Monster.new("Goblin", 5, 3)
@troll = Monster.new("Troll", 15, 6)
@library = Room.new("Library", "a large room filled with dark wooden bookcases that reach from the floor the ceiling. There is one door on the west wall.")
@hallway = Room.new("Hallway", "a vast empty corridor lined with stone pillars. A massive wooden door lies partially open at the northern end. Light spills through the opening of the door.")
@armory = Room.new("Armory", "a dark, cold room lined with stone. The walls are lined what used to be usable weapons and armor. Time has defeated them. There are doors on north and south walls.")
@study = Room.new("Study", "a warm, well lit room. This room is small, but invitiing. All the candles are lit and it appears someone spends a lot of time, or maybe spent a lot of time here. There are two doors, one on the north and one on the east wall.")
@cellar = Room.new("Cellar", "a cold, stone walled and floored room that obviously used to house food and drink. A long while seems to have passed since either of those could actually be found in the room though.")
@dungeon = Room.new("Dungeon", "a cold, bleek room with a terrible stench. It is hard to see, but it what looks like prison cells line the northern and southern walls.")
@rooms = [@library, @armory, @dungeon, @cellar, @study].shuffle.append(@hallway)
@current_room = 0


puts"THE GAME IS SIMPLE, INPUT THE LETTER OF YOUR CHOICE.".blue
puts"You open your eyes and see ..."


while @current_room <= 5
    # Output room you are in
    puts "#{@rooms[@current_room].description}"

    # give options for room
    puts "What would you like to do"
    if @current_room == 0
    puts "A:Search the Room. B:Wait C:Go to the next room"
    else
    puts "A:Search the Room. B:Wait C:Go to the next room D:Go back a room"
    end
    
    # take input for options
    @choice = gets.chomp.upcase
        
    # respond to input
    choices = ["A", "B", "C", "D"]
    if !choices.include?(@choice)
        puts"Hey dummy, input a letter"
    else
        if @choice == "A"
        end
        if @choice == "B"
        end
        if @choice == "C"
            @current_room += 1
        end
        if @current_room != 0 && @choice == "D"
            @current_room -= 1
        end
    end

end

puts "You made it out! Would you like to try again?"




































