require_relative 'Add'
require_relative 'Minus'
require_relative 'Multiply'
require_relative 'Divide'
require_relative 'Number'
require_relative 'Machine'
require_relative 'Variable'
require_relative 'LessThan'
require_relative 'DoNothing'
require_relative 'Assign'
require_relative 'If'
require_relative 'Boolean'
require_relative 'Sequence'
require_relative 'While'

Machine.new(
    Minus.new(Variable.new(:x), Variable.new(:y)),
    {x: Number.new(3), y: Number.new(4)}
).run

Machine.new(
    Divide.new(Variable.new(:x), Variable.new(:y)),
    {x: Number.new(525), y: Number.new(5)}
).run

puts

Machine.new(
    LessThan.new(Add.new(Number.new(2), Number.new(10)), Number.new(3))
).run

puts

Machine.new(
    LessThan.new(Variable.new(:x), Variable.new(:y)),
    {x: Add.new(Number.new(2), Number.new(10)), y: Number.new(9)}
).run