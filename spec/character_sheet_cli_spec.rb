RSpec.describe "CLI" do
	let(:cli) { CharacterSheetGenerator::CLI.new() }

	it "exists" do
		expect(cli).not_to be_nil
	end

	describe "#call" do
		it "puts out a welcome message" do
			allow(cli).to receive(:gets).and_return("exit")

			expect($stdout).to receive(:puts)
			expect($stdout).to receive(:puts)

			cli.call()
		end

		it "gets input" do
			allow(cli).to receive(:gets).and_return("exit")
		
			expect(cli).to receive(:gets)

			capture_puts { cli.call() }
		end

		it "can call #help" do
			allow(cli).to receive(:gets).and_return("help", "exit")

			expect(cli).to receive(:help)

			capture_puts { cli.call() }
		end
	end

end