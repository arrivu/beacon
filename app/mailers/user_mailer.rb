class UserMailer < ActionMailer::Base
 default :from => "admin@beacon.com"
  
  def course_payment(user,course_name,price)
  	@email = user.email
    @name = user.name
  	@course_desc =  course_name.short_desc
    @price = price
    mail(:to => "#{@email}", :subject => "Payment succesfully transfer")
  end

  def mail_contact(name,email,message)
  	message="Name: #{name}\nEmail: #{email}\nMessage:\n#{message}" 
  	mail(:to => Settings.admin_mail.to, :subject => "Contact Us",:body => message)
  end
end
