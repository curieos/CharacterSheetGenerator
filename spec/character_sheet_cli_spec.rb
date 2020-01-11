RSpec.describe "CLI" do
	let(:cli) { CharacterSheetGenerator::CLI.new() }

	it "exists" do
		expect(cli).not_to be nil
	end

	it "method #call puts out a welcome message" do
		expect($stdout).to receive(:puts)
		cli.call()
	end
  end