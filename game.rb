require 'colorize'
require './fight'
# 6 rooms (movement between should mirror the shape of "6"—top-right can only go west, top-left can only go east and south, etc).
# 3 items (that can be picked up/put down; show inventory)
# 2 monsters (can be attacked/die)
# start in random room,	
# should see room description (available movement), room items, monsters after each action
# end state I'll leave to you
class Player
    attr_accessor :hitpoints, :ap, :inventory
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
    attr_accessor :name, :hitpoints, :ap
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
@library = Room.new("Library", "a large room filled with dark wooden bookcases that reach from the floor the ceiling.")
@hallway = Room.new("Hallway", "a vast empty corridor lined with stone pillars. A massive wooden door lies partially open at the northern end. Light spills through the opening of the door.")
@armory = Room.new("Armory", "a dark, cold room lined with stone. The walls are lined what used to be usable weapons and armor. Time has defeated them.")
@study = Room.new("Study", "a warm, well lit room. This room is small, but inviting. All the candles are lit and it appears someone spends a lot of time, or maybe spent a lot of time here.")
@cellar = Room.new("Cellar", "a cold, stone walled and floored room that obviously used to house food and drink. A long while seems to have passed since either of those could actually be found in the room.")
@dungeon = Room.new("Dungeon", "a cold, bleek room with a terrible stench. It is hard to see, but it what looks like prison cells line the northern and southern walls.")
@rooms = [@library, @armory, @dungeon, @cellar, @study].shuffle.append(@hallway)
@room_index = 0


puts"THE GAME IS SIMPLE, INPUT THE LETTER OF YOUR CHOICE.".blue.bold
puts"You open your eyes and see ...".light_green.bold


while @room_index < @rooms.length
    # Output room you are in
    puts "#{@rooms[@room_index].description.light_green.bold}"
    # We only want to fight in certain rooms
    if @rooms[@room_index] == @armory || @rooms[@room_index] ==  @dungeon || @rooms[@room_index] ==  @cellar
        if rand(10) > 5
            puts "A goblin attacks you"
            Fight.new(@player, @goblin).fight_cycle 
        end
    end
    if @room_index == 5
        Fight.new(@player, @troll).fight_cycle
    end
    if @player.hitpoints <= 0
        puts "You have died".red.bold
        puts "Would you like to try again?(Y/N)".cyan.blink.bold
        @again = gets.chomp.upcase
        if @again == "Y"
            @room_index = 0
        else
            puts "Coward!".yellow
        end
        break
    end
    # give options for room
    puts "What would you like to do".red
    if @room_index == 0
        puts "A:Search the Room. B:Wait C:Go to the next room".blue
    else
        puts "A:Search the Room. B:Wait C:Go to the next room D:Go back a room".blue
    end
    
    # take input for options
    @choice = gets.chomp.upcase
        
    # respond to input
    case @choice
    when "A"
        puts @choice
    when "B"
        puts @choice
    when "C"
        @room_index += 1
        puts "You enter the room and see...".light_green.bold
    when @room_index != 0 && @choice == "D"
        @room_index -= 1
    else
        puts"Hey dummy, input one the correct letters".green
    end

    if @room_index >= @rooms.length
        puts "You made it out! Would you like to try again? (Y/N)".cyan.blink.bold
        @again = gets.chomp.upcase
        if @again == "Y"
            @room_index = 0
        else
            puts "Coward!".yellow
        end
    end
end




































