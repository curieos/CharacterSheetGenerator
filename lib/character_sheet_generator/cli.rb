class CharacterSheetGenerator::CLI
	def initialize
		@characters = []
	end

	def call
		puts "Welcome to the D&D character sheet generator!"
		puts "Type 'help' for a list of commands"
		loop do
			input = gets.strip.downcase

			break if input == "exit"

			case input
			when "export"

			when "help"
				help
			when "list"
				list
			when "new"

			else
				puts "'#{input}' is not a recognized command"
			end
		end
	end

	def help
		puts ""
		puts <<-DOC.gsub /^\s*/, ''
			Commands
			exit - exits the program
			export - export a character
			help - displays this help page
			list - lists existing characters
			new - creates a new character
		DOC
		puts ""
	end

	def list
		return puts "No characters exist!" if @characters.length == 0
	end
end