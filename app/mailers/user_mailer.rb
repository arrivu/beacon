class UserMailer < ActionMailer::Base
  default :from => "admin@beacon.com"
  
  def course_payment(user,course_name)
  	@email = user.email
    @name = user.name
  	@course_name =  course_name
    @price = "10"
    mail(:to => "#{@email}", :subject => "Payment succesfully transfer")
  end

  def mail_contact(name,email,message)
  	to="sukumar.inapp@gmail.com"
  	message=message+"\n"+name+"\n"+email
  	mail(:to => to, :subject => "Contact Us",:body => message)
  end

end
