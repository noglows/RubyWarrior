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
    @has_rescued ||= false

    if @has_rescued == false
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
        @has_rescued = true
      end
    else


      if warrior.feel.captive?
        warrior.rescue!
      elsif @damaged  && warrior.feel.empty? && warrior.health <= 15
        warrior.walk!(:backward)
      elsif @damaged  && warrior.feel.empty? && warrior.health > 15
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
