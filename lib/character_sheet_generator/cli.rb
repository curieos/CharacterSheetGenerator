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
			end
		end
	end

	def help

	end
end