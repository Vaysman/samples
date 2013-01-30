# http://www.valibuk.net/2009/03/domain-specific-languages-in-ruby/
class Tape
  def initialize
    @pos = 0
    @tape = []
  end

  def self.load(filename)
    new.instance_eval(File.read(filename), filename)
  end

  def right
    @tape.push nil if @tape.size == @pos
    @pos += 1
  end

  def left
    if @pos == 0
      @tape.unshift nil
    else
      @pos -= 1
    end
  end

  def write(val)
    @tape[@pos] = val
  end

  def dump
    puts "[#{@tape.map {|c| " #{c} "}.tap {|t| t[@pos] = "|#{@tape[@pos]}|" }.join(',')}]"
  end
end

Tape.load(ARGV.shift)