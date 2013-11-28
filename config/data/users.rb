module Userdata

  def self.VALID_USER
    "******************************"
  end

  def self.VALID_UNKNOWN_USER
    "******************************"
  end

  def self.INVALID_USER_FORMAT
    "an_invalid_userid"
  end

  def self.VALID_ANSWER_CHARACTER_A
    "a"
  end

  def self.VALID_ANSWER_CHARACTER_space
    " "
  end

  def self.VALID_ANSWER_CHARACTER_DIGIT
    "9"
  end

  def self.INVALID_ANSWER_CHARACTER_NORMAL_Q
    "+"
  end

  def self.INVALID_ANSWER_CHARACTER_D
    "++"
  end

  def self.VALID_ANSWER_CHARACTER_D
    "11"
  end

  def self.LOCKED_AT_UTM_USERID
    "******************************"
  end

  def self.USERID_WITH_NO_ROLES
    "******************************"
  end

  def self.USERID_WITH_NO_SECURITY_DETAILS
    "******************************"
  end

  def self.USERID_WITH_LESS_SECURITY_DETAILS
    "******************************"
  end

  def self.VALID_RANDOM_USER
    p1=('A'..'Z').to_a.shuffle[0,4].join
    p2=(0..9).to_a.shuffle[0,4].join
    return p1+p2
  end
end