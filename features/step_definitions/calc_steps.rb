# encoding: utf-8

Допустим /ввожу в калькулятор (\S*) число (\d+)/ do |позиция, число|
  if позиция == 'первое'
    calc.op1 = число
  else
    calc.op2 = число
  end
end

Если /нажимаю "(.*)"/ do |операция|
  operations = {
    'Сложить' => :add,
    'Делить'  => :div
  }
   calc.action = operations[операция]
end

То /результатом должно быть число (\d+)/ do |результат|
  calc.calculate
  calc.result.should == результат.to_i
end
