class Divide < Struct.new(:left, :right)

  def evaluate(environment)
    Number.new(left.evaluate(environment).value / right.evaluate(environment).value)
  end

  def to_s
    "#{left} / #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Divide.new(left.reduce(environment), right)
    elsif right.reducible?
      Divide.new(left, right.reduce(environment))
    else
      Number.new(left.value / right.value)
    end
  end

  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) / (#{right.to_ruby}).call(e) }"
  end

end