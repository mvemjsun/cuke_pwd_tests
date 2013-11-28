class ConfirmPage

	include PageObject
  include PageFactory

	form(:question_form, :id => "confirm_form") 
	label(:question_text, :name => "question")
  button(:change_password, :id => "change_password")
  div(:answer_row1, :name => "answer_row", :index => 0)
  div(:answer_row2, :name => "answer_row", :index => 1)
  div(:answer_row3, :name => "answer_row", :index => 2)
  text_field(:newpassword, :name => "newpassword")
  text_field(:newpassword_confirmation, :name => "confirm_newpassword")
  span(:userid, :id => "userid")
  span(:session_id, :id => "session_id")


	# @todo find better way to select questions
	def question_count
		question = question_form_element.label_elements
    question.select.count {|question| question.attribute("name") == "question"}
  end

  def change_password_with_success
    self.change_password
    return on(AcknowledgementPage)
  end

  def questions_should_not_have_invalid_answer_characters
    question = question_form_element.label_elements
    presented_questions = question.select {|question| question.attribute("name") == "question"}
    pattern = /\s0[th,st,nd]/
    invalid_questions = presented_questions.select do |q|
      if(q.text =~ pattern) then
        true
      end
    end
    invalid_questions.count == 0 ? true : false
  end

  # The question text asked
  def question_texts_presented
    question = question_form_element.label_elements
    presented_questions = question.select {|question| question.attribute("name") == "question"}
    @questions = []
    presented_questions.each do |question_element|
      @questions.push question_element.text
    end
    return @questions
  end

  # Checks that the questions have the correct format
  def duplicate_answer_characters
    questions = question_texts_presented
    duplicates = false
    pattern = /(?<pos1>\d\w\w) & (?<pos2>\d\w\w)/
    questions.each do |question_text|
       if (pattern =~ question_text)
          if ($~[:pos1] == $~[:pos2])
            duplicates = true
          end
       end
    end
    return duplicates
  end

  def enter_valid_format_but_wrong_form_data
    form_dynamic_textinput_names.each do |dynamic_element_name|
      x = dynamic_element_name.to_sym
      pattern = /__[year,month,day]/i
      if ( dynamic_element_name =~ pattern ) then
        self.send("#{x}=", "01")
      else
        self.send("#{x}=", "x")
      end
    end
    enter_correct_password
  end

  def answer_questions_correctly
    form_dynamic_textinput_names.each do |dynamic_element_name|
      x = dynamic_element_name.to_sym
      pattern = /__[year,month,day]/i
      if ( dynamic_element_name =~ pattern ) then
        self.send("#{x}=", Userdata.VALID_ANSWER_CHARACTER_D)
      else
        self.send("#{x}=", Userdata.VALID_ANSWER_CHARACTER_A)
      end
    end
    enter_correct_password
  end

  # get the security questions presented
  # SCHOOL+1,6/MOTHER+2,4/DOB+3
  def security_questions_presented
    input_names = form_dynamic_textinput_names
    ha = {}
    input_names.each do |name|
      case
        when name =~ /mother__/
          (pre,pos) = name.split("__")
          ha[pre] = ha.has_key?(pre) ? ha[pre]+","+pos : pos
        when name =~ /fattwn__/
          (pre,pos) = name.split("__")
          ha[pre] = ha.has_key?(pre) ? ha[pre]+","+pos : pos
        when name =~ /school__/
          (pre,pos) = name.split("__")
          ha[pre] = ha.has_key?(pre) ? ha[pre]+","+pos : pos
        when name =~ /town__/
          (pre,pos) = name.split("__")
          ha[pre] = ha.has_key?(pre) ? ha[pre]+","+pos : pos
        when name =~ /dob__/
          (pre,pos) = name.split("__")
          ha[pre] = ha.has_key?(pre) ? ha[pre]+","+pos : pos
      end
    end
    # join upper-cased keys and values with a + in between
    db_row=""
    ha.each do |k,v|
      v.gsub!(/day/, "1")
      v.gsub!(/month/, "2")
      v.gsub!(/year/, "3")

      db_row << k.upcase + "\+" + v + "\/"
    end
    db_row.chomp("/")
  end

  private

  def enter_correct_password
    @password = Passworddata.CORRECT_PASSWORD
    self.newpassword = @password
    self.newpassword_confirmation = @password
  end

  def enter_short_password
    self.newpassword = Passworddata.SHORT_PASSWORD
    self.newpassword_confirmation = Passworddata.SHORT_PASSWORD
  end

  def enter_invalid_password
    self.newpassword = Passworddata.SIMPLE_PASSWORD
    self.newpassword_confirmation =  Passworddata.SIMPLE_PASSWORD
  end

  # Dynamically generate form elements and get the names

  def form_dynamic_textinput_names
    question1_element_name = ""
    question2_element_name = ""
    question3_element_name = ""
    dynamic_names = []

    answer_row1_element.text_field_elements.each do |page_input_element|
      question1_element_name = page_input_element.attribute("name")
      dynamic_names << question1_element_name
      class_eval do
        text_field(question1_element_name.to_sym, :name=>question1_element_name)
      end
    end
    answer_row2_element.text_field_elements.each do |page_input_element|
      question2_element_name = page_input_element.attribute("name")
      dynamic_names << question2_element_name
      class_eval do
        text_field(question2_element_name.to_sym, :name=>question2_element_name)
      end
    end
    answer_row3_element.text_field_elements.each do |page_input_element|
      question3_element_name = page_input_element.attribute("name")
      dynamic_names << question3_element_name
      class_eval do
        text_field(question3_element_name.to_sym, :name=>question3_element_name)
      end
    end
    return dynamic_names
  end

end