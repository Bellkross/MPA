require_relative 'Pattern'
require_relative 'Empty'
require_relative 'Literal'
require_relative 'Concatenate'
require_relative 'Choose'
require_relative 'Repeat'

pattern =
    Repeat.new(
        Concatenate.new(
            Literal.new('a'),
            Choose.new(Empty.new, Literal.new('b'))
        )
    )

puts pattern