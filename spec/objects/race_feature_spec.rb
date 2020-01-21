RSpec.describe 'RaceFeature' do
	let(:dummy_race_feature) { CharacterSheetGenerator::RaceFeature.new("Dark Vision", "") }

	it "has source that is 'Race'" do
		expect(dummy_race_feature.source).to eq("Race")
	end
end