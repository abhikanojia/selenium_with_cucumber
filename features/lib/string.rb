class String
  def random_email
    self.to_s+"+"+Time.now.to_i.to_s+"@vinsol.com"
  end

  def self.password
    Time.now.to_i.to_s
  end

  def self.invalid_email
    Time.now.to_i.to_s
  end
end