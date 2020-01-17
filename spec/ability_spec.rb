RSpec.describe "Ability" do
	let(:dummy_ability) { CharacterSheetGenerator::Ability.new("Strength", 13, 2, [{Athletics: 1}]) }

	it "exists" do
		expect(dummy_ability).to_not be_nil
	end

	it "has a name" do
		expect(dummy_ability.name).to eq("Strength")
	end

	it "has a base score" do
		expect(dummy_ability.base_score).to eq(13)
	end

	it "has a bonus score" do
		expect(dummy_ability.bonus_score).to eq(2)
	end

	it "has method #score that returns the total score" do
		expect(dummy_ability.score).to eq(15)
	end

	it "has method #modifier that calculates the ability modifier" do
		expect(dummy_ability.modifier).to eq(2)
	end

	it "#modifier is not hard-coded" do
		new_ability = CharacterSheetGenerator::Ability.new("Strength", 2, 0, [{Athletics: 1}])

		expect(new_ability.modifier).to eq(-4)
	end

	it "has skills" do
		expect(dummy_ability.skills.length).to_not eq(0)
	end
end