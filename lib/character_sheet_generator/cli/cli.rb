class CharacterSheetGenerator::CLI
	def initialize(_url = "http://www.dnd5eapi.co/api/")
		@characters = []
		@classes = CharacterSheetGenerator::Classes.new(_url)
	end

	def call
		puts "Welcome to the D&D character sheet generator!"
		puts "Type 'help' for a list of commands"
		loop do
			input = gets.strip.downcase

			break if input == "exit"

			case input
			when "export"
				export
			when "help"
				help
			when "list"
				list
			when "new"
				new_character
			when "pdf"
				pdf
			else
				puts "'#{input}' is not a recognized command"
			end
		end
	end

	def export
		puts "not implemented"
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
			pdf - saves a character as a PDF
		DOC
		puts ""
	end

	def list
		puts ""
		return puts "No characters exist!\n\n" if @characters.length == 0
		puts "Characters:"
		@characters.each do |character|
			puts "#{character.name}"
		end
		puts ""
	end

	def new_character
		puts ""
		puts "Enter a name for your character:"
		name = gets.strip
		character = CharacterSheetGenerator::Character.new(name, CharacterSheetGenerator::Class.new("Bard", 6), 4, "", "")
		@characters << character
		puts ""
	end

	def pdf
		puts "not implemented"
	end
end