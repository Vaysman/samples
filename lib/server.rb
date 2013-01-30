require 'sinatra'
require 'slim'
require_relative 'calculator'

get '/' do
  slim :index
end

post '/' do
  calc = Calculator::Calculator.new
  calc.op1 = params[:operand1].to_i
  calc.op2 = params[:operand2].to_i
  calc.action = ([:add, :sub, :mul, :div] & params.keys.map(&:to_sym)).first

  params[:result] = calc.calculate

  slim :index
end
__END__
@@ layout
doctype 5
html
  head
    title Простой калькулятор
  body
    h1 Я простой калькулятор
    p Введите два числа и нажмите кнопку для выполнения желаемого действия
    == yield

@@ index
form method='post'
  input type='text' name='operand1' value=params[:operand1]
  input type='text' name='operand2' value=params[:operand2]
  p
    input type='submit' name='add' value='Сложить'
    input type='submit' name='sub' value='Вычесть'
    input type='submit' name='mul' value='Умножить'
    input type='submit' name='div' value='Делить'
  p
    | Результат:
    = params[:result]