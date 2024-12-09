class NotificationMailer < ApplicationMailer
  # default from: 'no-reply@example.com'

  def send_email(name, email_data)
    # byebug
    template = EmailFormat.find_by(name: name)

    return unless template

    @description = template.content
    mail(
      to: email_data[:to],
      subject: email_data[:subject],
      from: 'test0.dev01@gmail.com' # Specify a custom "From" address here
    )
    # mail(to: email_data[:to], subject: email_data[:subject])
  end
end
