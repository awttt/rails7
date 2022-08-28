class UserMailer < ApplicationMailer
  def welcome_email(code)
    @code = code
    mail(to: "anwenteng@foxmail.com", subject: 'hi')
  end
end
