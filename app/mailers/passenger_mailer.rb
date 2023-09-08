class PassengerMailer < ApplicationMailer
    default from: 'bookadmin@example.com'

  def confirmation_email(booking)
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Thank you for booking!')
  end
end
