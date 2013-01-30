# encoding: utf-8
module Calc
  def calc
    @calc ||= Calculator::Calculator.new
  end
end

World(Calc)