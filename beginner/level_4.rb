class Player
  
  def initialize
      @health = 20
  end

  def play_turn(warrior)
    
    if warrior.feel.empty?
      @new_health = warrior.health
      
      if @new_health < @health # you're taking damage
        warrior.walk!
      elsif @new_health < 20
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
    
    @health = warrior.health
  end
end