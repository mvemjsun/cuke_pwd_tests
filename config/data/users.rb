module Userdata

  def self.VALID_USER
    "MELL0001"
  end

  def self.VALID_UNKNOWN_USER
    "XXDD0001"
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
    "TONK0001"
  end

  def self.USERID_WITH_NO_ROLES
    "ABCD0004"
  end

  def self.USERID_WITH_NO_SECURITY_DETAILS
    "ABAS0001"
  end

  def self.USERID_WITH_LESS_SECURITY_DETAILS
    "LONG0001"
  end
end