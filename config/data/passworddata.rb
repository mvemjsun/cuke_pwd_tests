module Passworddata

  def self.CORRECT_PASSWORD
    p1=('a'..'z').to_a.shuffle[0,4].join
    p2=(0..9).to_a.shuffle[0,4].join
    return p1+p2
  end

  def self.SHORT_PASSWORD
     "PASS"
  end

  def self.SIMPLE_PASSWORD
     "SSSS1111"
  end
end