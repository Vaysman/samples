module Calculator
  class SubOperation
    def execute(arg1, arg2)
      arg1 - arg2
    end
  end

  class AddOperation
    def execute(arg1, arg2)
      arg1 + arg2
    end
  end

  class MulOperation
    def execute(arg1, arg2)
      arg1 * arg2
    end
  end

  class DivOperation
    def execute(arg1, arg2)
      (arg2 == 0) ? 0 : arg1 / arg2
    end
  end

  class BadOperation
    def execute(arg1, arg2)
      0
    end
  end

  class Calculator
    attr_accessor :op1, :op2
    attr_reader :result

    def initialize
      op1 = 0
      op2 = 0
      result = 0
      @operation = BadOperation.new
    end

    def action=(op)
      @operation = case op
        when :mul
          MulOperation.new
        when :add
          AddOperation.new
        when :div
          DivOperation.new
        when :sub
          SubOperation.new
        else
          BadOperation.new
      end
    end

    def calculate
      @result = @operation.execute(op1.to_i, op2.to_i)
    end
  end
end