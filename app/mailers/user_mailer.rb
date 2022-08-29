class UserMailer < ApplicationMailer
  def welcome_email(email)
    #.order(create_at: :desc) 找最后生成的数据
    validation_code = ValidationCode.order(create_at: :desc).find_by_email(email)
    @code = validation_code.code
    mail(to: email, subject: '验证码')
  end
end
 