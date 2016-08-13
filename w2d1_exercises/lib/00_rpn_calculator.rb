class RPNCalculator
  # TODO: your code goes here!
  @@operators = ['-', '+', '*', '/']

  def initialize
    @stack = []
    @token = []
  end

  def check_stack
    raise Exception, 'calculator is empty' if @stack.empty?
  end

  def push(number)
    @stack << number
  end

  def value
    @stack[-1]
  end

  def plus
    check_stack
    @stack << @stack.pop + @stack.pop
  end

  def minus
    check_stack
    @stack << 0 - @stack.pop + @stack.pop
  end

  def divide
    check_stack
    @stack << 1.0 / @stack.pop * @stack.pop
  end

  def times
    check_stack
    @stack << @stack.pop * 1.0 * @stack.pop
  end

  def tokens(string = '')
    string.gsub!(/\s+/, '')

    i = 0

    while i < string.length
      @token << if @@operators.include? string[i]
                  string[i].to_sym
                else
                  string[i].to_i
                end
      i += 1
    end
    @token
  end

  def evaluate(string = '')
    tokens(string)

    i = 0

    while i < @token.length
      interpret(@token[i])
      i += 1
    end

    @stack[-1]
  end

  def interpret(token_index)
    case token_index
    when Fixnum
      push(token_index)
    when Float
      push(token_index)
    when :+
      plus
    when :-
      minus
    when :*
      times
    when :/
      divide
    end
  end
end
