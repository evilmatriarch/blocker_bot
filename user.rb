class User
  attr_reader :handle
  attr_reader :modes

  def initialize(handle = "", modes = "")
    @modes = modes
    @handle = handle

    process_modes
  end

  def block!
    @modes += "b" unless blocked?
  end

  def blocked?
    @modes.match(/b/)
  end

  def report!
    @modes += "r" unless reported?
  end

  def reported?
    @modes.match(/r/)
  end

  private

  def block
    # here, you'd actually block the user
    puts "Blocked #{handle}."
  end

  def report
    # here, you'd actually report the user
    puts "Reported #{handle}."
  end

  def process_modes
    block if blocked?
    report if reported?
  end
end
