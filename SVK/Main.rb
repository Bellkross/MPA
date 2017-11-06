require_relative 'Add'
require_relative 'Multiply'
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
    While.new(
        LessThan.new(Variable.new(:x), Number.new(5)),
        Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
    )
statement.to_ruby
proc = eval(statement.to_ruby)
proc.call({ x: 1 })