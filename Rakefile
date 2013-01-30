# encoding: UTF-8

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:'calc:spec') do |c|
  c.rspec_opts = '--color --format documentation -I .'
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:'calc:features') do |t|
  t.cucumber_opts = "features --format pretty --tags ~@web"
end

Cucumber::Rake::Task.new(:'calc:web:features') do |t|
  t.cucumber_opts = "features --format pretty --tags @web"
end

task :default => 'calc:spec'

namespace :calc do
  desc 'Выполнить сложение двух чисел'
  task :add, :op1, :op2 do |t, ops|
    require './lib/calculator'
    calc = Calculator::Calculator.new
    calc.op1 = ops[:op1]
    calc.op2 = ops[:op2]
    calc.action = :add
    calc.calculate
    puts "#{ops[:op1]} + #{ops[:op2]} = #{calc.result}"
  end

  desc 'Deploy calculator to Heroku'
  task :deploy do
    `heroku create`
    `git push heroku master`
  end
end

desc 'Поприветствовать собравшихся'
task :hello do
  require 'artii'
  a = Artii::Base.new
  puts a.asciify 'Hello, DevClub!'
end

desc 'Запустить квайн'
task :quine do
  exec 'clear; for j in 1 2 3 4 5 6 7 8 9 10; do for i in 1 2 3 4 5 6 7 8 10; do cat qlob.rb;ruby qlob.rb 15 > 1.rb;mv 1.rb qlob.rb;sleep 0.5;clear;done;done'
end
