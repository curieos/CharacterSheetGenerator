RSpec.describe "Class" do
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Dummy Name", 10) }

	it "exists" do
		expect(dummy_class).to_not be_nil
	end

	it "has a name" do
		expect(dummy_class.name).to eq("Dummy Name")
	end

	it "has a level" do
		expect(dummy_class.level)
	end

	it "sets level to 1" do
		expect(dummy_class.level).to eq(1)
	end

	it "has a hit die" do
		expect(dummy_class.hit_die).to eq(10)
	end

	it "has method #level_up that increases the level" do
		new_class = CharacterSheetGenerator::Class.new("new class", 8)

		new_class.level_up()

		expect(new_class.level).to eq(2)
	end
end