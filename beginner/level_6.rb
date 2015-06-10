class Player
  
  def initialize
    @health = 20
    @hit_wall = false
    @taking_damage = 0
  end

  def play_turn(warrior)
    
    if @hit_wall # is true
      if warrior.feel.empty?
        @new_health = warrior.health
        
        if @new_health < @health && @taking_damage < 1 # taking damage
          @taking_damage += 1
          warrior.walk!
        elsif @new_health < @health && @taking_damage >= 1 # taking damage for 2nd time in a row
         
          warrior.walk!(:backward)
        elsif @new_health < 20
          warrior.rest!
        else
          warrior.walk!
        end

      else #something is in front of you
        if @health = 20 # i.e. you're okay to fight
          warrior.attack!
        else # retreat!
          warrior.walk!(:backward)
        end
      end
      
      
    else # you haven't hit the wall yet
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
      elsif warrior.feel(:backward).wall?
        @hit_wall = true
        warrior.walk!
      end
    end
    
    @health = warrior.health
    
  end #play_turn
end


# Walk backward if you are taking damage from afar 
# and do not have enough health to attack. You may also 
# want to consider walking backward until 
# warrior.feel(:backward).wall?


