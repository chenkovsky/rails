class BinaryPredicate < Predicate
  attr_reader :attribute1, :attribute2
  
  def initialize(attribute1, attribute2)
    @attribute1, @attribute2 = attribute1, attribute2
  end
  
  def ==(other)
    super and @attribute1.eql?(other.attribute1) and @attribute2.eql?(other.attribute2)
  end
  
  def qualify
    self.class.new(attribute1.qualify, attribute2.qualify)
  end
  
  def to_sql(options = {})
    "#{attribute1.to_sql} #{predicate_sql} #{attribute2.to_sql}"
  end
end