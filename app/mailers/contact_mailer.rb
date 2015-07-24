class ContactMailer < ApplicationMailer

default from: 'answerawesome@gmail.com'


  def contact_email(name)
    mail :to => "boredhannah@gmail.com", :subject => "You are being contacted"
  end

end
