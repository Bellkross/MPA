require_relative 'FARule'
require_relative 'DFARuleBook'
require_relative 'DFA'
require_relative 'DFADesign'
require_relative 'NFARulebook'
require_relative 'NFA'
require_relative 'NFADesign'

rulebook = NFARulebook.new([
                               FARule.new(1, nil, 2), FARule.new(1, nil, 4),
                               FARule.new(2, 'a', 3),
                               FARule.new(3, 'a', 2),
                               FARule.new(4, 'a', 5),
                               FARule.new(5, 'a', 6),
                               FARule.new(6, 'a', 4)
                           ])

rulebook.next_states(Set[1], nil)

rulebook.follow_free_moves(Set[1])