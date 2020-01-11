class CharacterSheetGenerator::CLI
	def initialize
		
	end

	def call
		puts "Welcome to the D&D character sheet generator!"
		puts "Type 'help' for a list of commands"
		loop do
			input = gets.strip.downcase

			break if input == "exit"

			case input
			when "help"
				help
			else
				puts "'#{input}' is not a recognized command"
			end
		end
	end

	def help

	end
end