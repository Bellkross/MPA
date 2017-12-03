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


statement =
    Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
    )

puts statement
LessThan.new(
    Add.new(Variable.new(:x), Number.new(2)),
    Variable.new(:y)
).evaluate({x: Number.new(2), y: Number.new(5)})

statement =
    While.new(
        LessThan.new(Variable.new(:x), Number.new(55)),
        Assign.new(:x, Add.new(Variable.new(:x), Number.new(3)))
    )
puts statement.evaluate({x: Number.new(1)})