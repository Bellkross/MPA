class While < Struct.new(:condition, :body)

  def evaluate(environment)
    case condition.evaluate(environment)
      when Boolean.new(true)
        evaluate(body.evaluate(environment))
      when Boolean.new(false)
        environment
    end
  end

  def to_ruby
    "-> e {" +
        " while (#{condition.to_ruby}).call(e);" +
        " e = (#{body.to_ruby}).call(e); end;" +
        " e" +
        " }"
  end

end
