class HomePage

	include PageObject

	page_url = 'www.motgarages.co.uk/password/identify'
	text_field(:user_id, :id => "q")
	button(:identify_user, :name => "identify")
  hidden_field(:session_id, :id => "session_id")


	def enter_valid_userid(user_id_supplied=Userdata.VALID_USER)
		self.user_id = user_id_supplied
		identify_user
    return user_id_supplied
  end

  def identify_with(user_id_supplied)
    self.user_id = user_id_supplied
    identify_user
  end

  def enter_locked_userid(user_id_supplied=Userdata.LOCKED_AT_UTM_USERID)
    self.user_id = user_id_supplied
    identify_user
    return user_id_supplied
  end

  def enter_userid_with_no_roles(user_id_supplied=Userdata.USERID_WITH_NO_ROLES)
    self.user_id = user_id_supplied
    identify_user
    return user_id_supplied
  end

  def enter_userid_with_less_security_details(user_id_supplied=Userdata.USERID_WITH_LESS_SECURITY_DETAILS)
    self.user_id = user_id_supplied
    identify_user
    return user_id_supplied
  end

  def enter_userid_with_no_security_details(user_id_supplied=Userdata.USERID_WITH_NO_SECURITY_DETAILS)
    self.user_id = user_id_supplied
    identify_user
    return user_id_supplied
  end

	def enter_valid_but_unknown_userid(user_id_supplied=Userdata.VALID_UNKNOWN_USER)
		self.user_id = user_id_supplied
		identify_user
    return user_id_supplied
	end

	def enter_no_userid
		self.user_id = ""
		identify_user
	end

	def enter_invalid_userid
		self.user_id = Userdata.INVALID_USER_FORMAT
		identify_user
	end

	def should_see_message(message)

	end

	def attempt_too_many_changes
		FactoryGirl.create(:Passwordattemptlog, :Attempt_Count => 10)
		enter_valid_userid
  end

  def enter_random_valid_format_userid
    self.user_id = Userdata.VALID_RANDOM_USER
    identify_user
  end

end