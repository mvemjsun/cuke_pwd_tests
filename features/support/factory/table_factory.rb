FactoryGirl.define do

	d= DateTime.now
	fdt = d.strftime('%F %T')
	fd  = d.strftime('%F')

	factory :Session do
		Session_ID "a8f43affc2b83d8706662f671b3584ab"
		Expire  "2013-10-01 11:11:11"
		Last_Activity "2013-10-01 11:11:01"
	end

	factory :Sessiondata do
		Session_ID "64e7f2053c46759dcda4ed94f9dbea91"
		Data_Key "auth"
		Data_Value "s:49:\"MOTHER+6+N/FATTWN+9+N/DOB+8+D/SCHOOL+8+N/TOWN+9+N\";"
	end

	factory :Securitylog do
		UserID Userdata.VALID_USER
		ChangeResult "F"
		Questions "s:21:\"TOWN+7/DOB+2/MOTHER+6\";"
	end	

	factory :Passwordattemptlog do
		UserID Userdata.VALID_USER
		AttemptDate "#{fd}"
		Last_Activity "#{fdt}"
		Attempt_Count "0"
	end		
end