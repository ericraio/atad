class EmailSubscriber

  def open(event)
    # :message and :controller keys
    ahoy = event[:controller].ahoy
    ahoy.track "Email Opened", message_id: event[:message].id, user: event[:message].user
  end

  def click(event)
    # same keys as above, plus :url
    ahoy = event[:controller].ahoy
    ahoy.track "Email Clicked", message_id: event[:message].id, url: event[:url], user: event[:message].user
  end

end

AhoyEmail.subscribers << EmailSubscriber.new
