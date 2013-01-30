require 'rspec'
require './lib/calculator'

describe Calculator::Calculator do
  context 'attributes' do
    it 'op1 can be read' do
      lambda { subject.op1 }.should_not raise_error
    end

    it 'op1 can be written' do
      subject.op1 = 1
      subject.op1.should eq(1)
    end

    it 'op2 can be read' do
      lambda { subject.op2 }.should_not raise_error
    end

    it 'op2 can be written' do
      subject.op2 = 1
      subject.op2.should eq(1)
    end

    it 'result can be read' do
      lambda { subject.result }.should_not raise_error
    end

    it 'action can be written' do
      lambda { subject.action = 1 }.should_not raise_error
    end
  end

  context '#calculate' do
    before do
      subject.op1 = 10
      subject.op2 = 4
    end

    it 'does sub correctly' do
      subject.action = :sub
      subject.calculate.should eq(6)
    end

    it 'does mul correctly' do
      subject.action = :mul
      subject.calculate.should eq(40)
    end

    it 'does add correctly' do
      subject.action = :add
      subject.calculate.should eq(14)
    end

    it 'does div correctly' do
      subject.action = :div
      subject.calculate.should eq(2)
    end

    it 'result attribute contains result of calculation of the last operation' do
      subject.action = :add
      subject.calculate
      subject.result.should eq(14)
    end
  end
end

describe Calculator::SubOperation do
  it 'execute(arg1, arg2) returns the difference of its arguments' do
    subject.execute(5, 3).should eq(2)
  end
end

describe Calculator::MulOperation do
  it 'execute(arg1, arg2) returns the product of its arguments' do
    subject.execute(5, 3).should eq(15)
  end
end

describe Calculator::AddOperation do
  it 'execute(arg1, arg2) returns the sum of its arguments' do
    subject.execute(5, 3).should eq(8)
  end
end

describe Calculator::DivOperation do
  it 'execute(arg1, arg2) returns truncated result of division of its arguments' do
    subject.execute(5, 3).should eq(1)
  end

  it 'execute(arg1, arg2) returns 0 when arg2 is equal 0' do
    subject.execute(5, 0).should eq(0)
  end
end

describe Calculator::BadOperation do
  it 'execute(arg1, arg2) always returns 0' do
    subject.execute(5, 3).should eq(0)
  end
end