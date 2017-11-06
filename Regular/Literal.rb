require_relative 'Pattern'
require_relative '../FA/FARule'
require_relative '../FA/DFARuleBook'
require_relative '../FA/DFA'
require_relative '../FA/DFADesign'
require_relative '../FA/NFARulebook'
require_relative '../FA/NFA'
require_relative '../FA/NFADesign'

class Literal < Struct.new(:character)
  include Pattern

  def to_s
    character
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_state = Object.new
    rule = FARule.new(start_state, character, accept_state)
    rulebook = NFARulebook.new([rule])
    NFADesign.new(start_state, [accept_state], rulebook)
  end

end
