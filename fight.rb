class Fight
    def initialize(fighter1, fighter2)
        @fighter1 = fighter1
        @fighter2 = fighter2
    end
    def fight_cycle
        while @fighter1.hitpoints > 0 && @fighter2.hitpoints > 0
            player_dmg = rand(@fighter1.ap) + 1
            @fighter2.hitpoints -= player_dmg
            puts"You did #{player_dmg} damage to the #{@fighter2.name}".magenta
            puts "\n"
            sleep 1.5
            enemy_dmg = rand(@fighter2.ap) + 1
            @fighter1.hitpoints -= enemy_dmg
            puts"The #{@fighter2.name} did #{enemy_dmg} damage to you.".magenta
            puts "\n"
            sleep 1.5
            is_dead
        end
    end
    def is_dead
        if @fighter1.hitpoints <= 0
            puts "You have died".red.bold
            puts "\n"
        elsif @fighter2.hitpoints <= 0
            puts "You have defeated the enemy".cyan.bold
            puts "\n"
        else
            puts"The fight continues".magenta.bold
            puts "\n"
        end
    end
end