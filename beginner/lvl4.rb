class Player

  def play_turn(warrior)
    @max_health = 20

    if @health == nil
      @health = @max_health
    end

    damaged?(warrior)
    warrior_decision(warrior)
    update_health(warrior)
  end

  def warrior_decision(warrior)
    if @damaged  && warrior.feel.empty?
      warrior.walk!
    elsif @damaged && !warrior.feel.empty?
      warrior.attack!
    elsif !@damaged && warrior.feel.empty? && warrior.health == 20
      warrior.walk!
    elsif !@damaged && !warrior.feel.empty? && warrior.health == 20
      warrior.attack!
    elsif !@damaged && warrior.health < 20
      warrior.rest!
    end
  end

  def damaged?(warrior)
    if @health > warrior.health
      @damaged =  true
    else
      @damaged = false
    end
  end

  def update_health(warrior)
    @health = warrior.health
  end
end
