require_relative 'Pattern'
require_relative '../FA/FARule'
require_relative '../FA/DFARuleBook'
require_relative '../FA/DFA'
require_relative '../FA/DFADesign'
require_relative '../FA/NFARulebook'
require_relative '../FA/NFA'
require_relative '../FA/NFADesign'

class Empty
  include Pattern

  def to_s
    ' '
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_states = [start_state]
    rulebook = NFARulebook.new([])
    NFADesign.new(start_state, accept_states, rulebook)
  end

end