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

Machine.new(
    While.new(
        LessThan.new(Variable.new(:x), Number.new(5)),
        Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
    ),
    { x: Number.new(1) }
).run
