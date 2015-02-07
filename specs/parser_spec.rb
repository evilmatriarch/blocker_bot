require_relative "../parser"

describe Parser do
  describe "#initialize" do
    it "should recognize users" do
      parser = Parser.new("@cool_dude")
      expect(parser.users.first.handle).to eq "cool_dude"
    end

    it "should block users" do
      parser = Parser.new("+b @butthead")
      expect(parser.users.first.blocked?).to eq true
    end

    it "should report users" do
      parser = Parser.new("+r @spammer")
      expect(parser.users.first.reported?).to eq true
    end

    it "should block and report users" do
      parser = Parser.new("+br @abuser")
      expect(parser.users.first.blocked?).to eq true
      expect(parser.users.first.reported?).to eq true
    end

    it "should not touch users without modes" do
      parser = Parser.new("+br @abuser @cool_dude")
      expect(parser.users.last.handle).to eq "cool_dude"
      expect(parser.users.last.blocked?).to eq false
      expect(parser.users.last.reported?).to eq false
    end

    it "should ignore random words" do
      parser = Parser.new("awesome @cool_dude")
      expect(parser.users.first.handle).to eq "cool_dude"
    end
  end
end
