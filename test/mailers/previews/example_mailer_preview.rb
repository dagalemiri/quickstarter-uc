# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview

  def sample_mail_preview
    ExampleMailer.sample_email(User.first)
  end

  def register_email_preview
    ExampleMailer.register_email(User.last)
  end

  def donation_email_investor_preview
    ExampleMailer.donation_email_investor(User.last,Project.last,Investment.last)
  end

end
