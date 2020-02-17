class CharacterSheetGenerator::CLI
	def initialize(_url = "www.dnd5eapi.co")
		@characters = []
		@races = CharacterSheetGenerator::Races.new(_url)
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
		puts ""
		puts "Choose a race"
		@races.list.each_with_index do |_race, index|
			puts "#{index+1}: #{_race}"
		end
		race_selection = gets.strip.to_i
		new_race = CharacterSheetGenerator::Race.new_from_hash(@races.get_race_by_index(race_selection))
		puts ""
		puts "Choose a class"
		@classes.list.each_with_index do |_class, index|
			puts "#{index+1}: #{_class}"
		end
		class_selection = gets.strip.to_i
		new_class = CharacterSheetGenerator::Class.new_from_hash(@classes.get_class_by_index(class_selection))
		@characters << CharacterSheetGenerator::Character.new(name, new_race, new_class, [], [], (new_class.hit_die/2)+1, "", "")
		puts ""
		puts "Character successfully created!"
	end

	def pdf
		puts "not implemented"
	end
end