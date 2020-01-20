RSpec.describe "Class" do
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Bard", 6, [CharacterSheetGenerator::Feature.new("Bardic Inspiration")]) }

	it "exists" do
		expect(dummy_class).to_not be_nil
	end

	it "has a name" do
		expect(dummy_class.name).to eq("Bard")
	end

	it "has a level" do
		expect(dummy_class.level)
	end

	it "sets level to 1" do
		expect(dummy_class.level).to eq(1)
	end

	it "has a hit die" do
		expect(dummy_class.hit_die).to eq(6)
	end

	it "has features" do
		expect(dummy_class.features).to_not be_nil
	end

	it "has method #level_up that increases the level" do
		dummy_class.level_up()

		expect(dummy_class.level).to eq(2)
	end

	it "has method #level_up that adds new class features" do
		features = [CharacterSheetGenerator::Feature.new("Jack of all Trades")]
		dummy_class.level_up(_features: features)

		features.each do |feature|
			expect(dummy_class.features).to include(feature)
		end
	end
end