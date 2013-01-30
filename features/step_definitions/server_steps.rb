# encoding: UTF-8

require 'capybara/cucumber'

Допустим /я перехожу на страницу с калькулятором/ do
  Capybara.app_host = 'http://localhost:9393'
  Capybara.default_driver = :selenium
  page.visit('/')
end

Допустим /ввожу в веб форму (\S*) число (\d+)/ do |позиция, число|
  if позиция == 'первое'
    fill_in 'operand1', with: число
  else
    fill_in 'operand2', with: число
  end
end

Если /^я нажимаю кнопку "(.*?)"$/ do |кнопка|
  click_on кнопка
end

То /^в веб форме я увижу результат число (\d+)$/ do |arg1|
  page.should have_content(arg1)
end