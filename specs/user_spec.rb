require_relative "../user"

describe User do
  describe "#initialize" do
    it "should have a handle" do
      user = User.new("awesome")
      expect(user.handle).to eq "awesome"
    end

    it "should normalize handles" do
      user = User.new("@awesome")
      expect(user.handle).to eq "awesome"
    end

    it "should be able to block from modes" do
      user = User.new("awesome", "+b")
      expect(user.blocked?).to eq true
    end

    it "should be able to report from modes" do
      user = User.new("awesome", "+r")
      expect(user.reported?).to eq true
    end

    it "should be able to block and report from modes at the same time" do
      user = User.new("awesome", "+br")
      expect(user.blocked?).to eq true
      expect(user.reported?).to eq true
    end

    it "should not block when it's not specified in modes" do
      user = User.new("awesome", "+r")
      expect(user.blocked?).to eq false
    end

    it "should not report when it's not specified in modes" do
      user = User.new("awesome", "+b")
      expect(user.reported?).to eq false
    end
  end

  describe "#block!" do
    it "should block users" do
      user = User.new("awesome")
      user.block!
      expect(user.blocked?).to eq true
    end

    it "should not report users" do
      user = User.new("awesome")
      user.block!
      expect(user.reported?).to eq false
    end
  end

  describe "#report!" do
    it "should report users" do
      user = User.new("awesome")
      user.report!
      expect(user.blocked?).to eq false
    end
  end
end
