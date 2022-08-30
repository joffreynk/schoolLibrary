require_relative './person'
require_relative './trimmer'
require_relative './capitalize'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person.name)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person.correct_name)
puts capitalized_trimmed_person.correct_name
