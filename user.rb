class User
  attr_reader :handle
  attr_reader :modes

  def initialize(handle = "", modes = "")
    @modes = modes
    @handle = handle

    normalize_handle
    process_modes
  end

  def block!
    return true if blocked?

    @modes += "b"
    block
  end

  def blocked?
    !@modes.match(/b/).nil?
  end

  def report!
    return true if reported?

    @modes += "r"
    report
  end

  def reported?
    !@modes.match(/r/).nil?
  end

  def puts_status
    puts "#{handle}'s modes: #{modes}"
    puts "#{handle} is blocked." if blocked?
    puts "#{handle} is reported." if reported?
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

  def normalize_handle
    @handle.slice!(/^@/)
  end

  def process_modes
    block if blocked?
    report if reported?
  end
end
