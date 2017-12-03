class Minus < Struct.new(:left, :right)

  def to_s
    "#{left} - #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Minus.new(left.reduce(environment), right)
    elsif right.reducible?
      Minus.new(left, right.reduce(environment))
    else
      Number.new(left.value - right.value)
    end
  end


end