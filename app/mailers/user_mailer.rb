class UserMailer < ActionMailer::Base
 default :from => "admin@beacon.com"
  
  def course_payment(user,price,invoice)
  	@email = user.email
    @price =price
    @name = user.name
    #invoice_pdf = Payday::PdfRenderer.render_to_file(invoice)
    #attachments['Invoice.pdf'] = { :mime_type => 'application/pdf', :content => invoice_pdf }
    mail(:to => "#{@email}", :subject => "Payment succesfully transfer")
  end

  def mail_contact(name,email,message)
  	message="Name: #{name}\nEmail: #{email}\nMessage:\n#{message}" 
  	mail(:to => Settings.admin_mail.to, :subject => "Contact Us",:body => message)
  end
  
end
