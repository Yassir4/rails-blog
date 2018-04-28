class WriterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.writer_mailer.reset_password_email.subject
  #
  def reset_password_email(writer)
    @writer = writer
    @greeting = "Hi"
    mail to: @writer.email, :subject => 'Reset password instructions'
  end
end
