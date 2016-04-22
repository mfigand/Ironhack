class Midas
  def initialize(initial_gold)
    @gold = initial_gold
  end

  def take_gold_from(other)
    @gold += other.gold
  end

  private
  def gold
    @gold
  end

end

>> m1 = Midas.new(10)
>> m2 = Midas.new(20)
>> m1.take_gold_from(m2)
NoMethodError: private method `gold' called

---

class Midas
    protected :gold
  end

  m1.take_gold_from(m2)
  => 30
