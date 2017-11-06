require_relative 'Pattern'
require_relative '../FA/FARule'
require_relative '../FA/DFARuleBook'
require_relative '../FA/DFA'
require_relative '../FA/DFADesign'
require_relative '../FA/NFARulebook'
require_relative '../FA/NFA'
require_relative '../FA/NFADesign'

class Concatenate < Struct.new(:first, :second)
  include Pattern

  def to_s
    [first, second].map {|pattern| pattern.bracket(precedence)}.join
  end

  def precedence
    1
  end

  def to_nfa_design
    frst_nfa_design = first.to_nfa_design
    second_nfa_design = second.to_nfa_design
    start_state = frst_nfa_design.start_state
    accept_states = second_nfa_design.accept_states
    rules = frst_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
    extra_rules = frst_nfa_design.accept_states.map {|state|
      FARule.new(state, nil, second_nfa_design.start_state)
    }
    rulebook = NFARulebook.new(rules + extra_rules)
    NFADesign.new(start_state, accept_states, rulebook)
  end

end
