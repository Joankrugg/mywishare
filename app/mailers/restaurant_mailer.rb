class RestaurantMailer < ApplicationMailer

  def notification(event)
    @event = event
    mail(to: "modernboxrecords@gmail.com", subject: 'Vous avez une réservation Mywishare')
    # This will render a view in `app/views/user_mailer`!
  end

end
