class CharacterSheetGenerator::CLI
	def initialize(_url = "www.dnd5eapi.co")
		@races = CharacterSheetGenerator::Races.new(_url)
		@classes = CharacterSheetGenerator::Classes.new(_url)
	end

	def call
		puts "Welcome to the D&D character sheet generator!"
		puts "Type 'help' for a list of commands"
		loop do
			input = gets.strip.downcase

			if input == "exit"
				binding.pry
				break
			end

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
		return puts "No characters exist!\n\n" if CharacterSheetGenerator::Character.all.length == 0
		puts "Characters:"
		CharacterSheetGenerator::Character.all.each do |character|
			puts "#{character.name}"
		end
		loop do
			puts "\nChoose a character to see more details (exit to exit):"
			selection = gets.strip

			break if selection == "exit"

			character = CharacterSheetGenerator::Character.all.find { |character| character.name == selection }
			if character
				puts ""
				puts <<-DOC.gsub /^\s*/, ''
					Character Name: #{character.name}
					Race: #{character.race.name}
					Size: #{character.race.size}
					Speed: #{character.race.speed}
					Class: #{character.classes[0].name}
					Hit Die: #{character.classes[0].hit_die}
				DOC
			else
				puts "Character not found!"
			end
		end
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
		race_selection = 0
		loop do
			race_selection = gets.strip.to_i

			break if race_selection > 0 && race_selection <= @races.list.length
		end
		new_race = CharacterSheetGenerator::Race.new_from_hash(@races.get_race_by_index(race_selection-1))
		puts ""

		puts "Choose a class"
		@classes.list.each_with_index do |_class, index|
			puts "#{index+1}: #{_class}"
		end
		class_selection = 0
		loop do
			class_selection = gets.strip.to_i

			break if class_selection > 0 && class_selection <= @classes.list.length
		end
		new_class = CharacterSheetGenerator::Class.new_from_hash(@classes.get_class_by_index(class_selection-1))
		CharacterSheetGenerator::Character.new(name, new_race, new_class, [], [], (new_class.hit_die/2)+1, "", "")
		puts ""

		puts "Character successfully created!"
	end

	def pdf
		puts "not implemented"
	end
end