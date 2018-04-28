# Preview all emails at http://localhost:3000/rails/mailers/writer_mailer
class WriterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/writer_mailer/reset_password_email
  def reset_password_email
    WriterMailerMailer.reset_password_email
  end

end
