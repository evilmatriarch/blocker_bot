require_relative "../blocker"

describe Blocker do
  describe "#initialize" do
    it "should recognize users" do
      blocker = Blocker.new("@cool_dude")
      expect(blocker.users.first.handle).to eq "cool_dude"
    end

    it "should block users" do
      blocker = Blocker.new("+b @butthead")
      expect(blocker.users.first.blocked?).to eq true
    end

    it "should report users" do
      blocker = Blocker.new("+r @spammer")
      expect(blocker.users.first.reported?).to eq true
    end

    it "should block and report users" do
      blocker = Blocker.new("+br @abuser")
      expect(blocker.users.first.blocked?).to eq true
      expect(blocker.users.first.reported?).to eq true
    end

    it "should not touch users without modes" do
      blocker = Blocker.new("+br @abuser @cool_dude")
      expect(blocker.users.last.handle).to eq "cool_dude"
      expect(blocker.users.last.blocked?).to eq false
      expect(blocker.users.last.reported?).to eq false
    end

    it "should ignore random words" do
      blocker = Blocker.new("awesome @cool_dude")
      expect(blocker.users.first.handle).to eq "cool_dude"
    end
  end
end
