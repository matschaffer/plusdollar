class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_pledge.subject
  #
  def new_pledge(pledge)
    @greeting = "Hi"

    mail to: pledge.user.email
  end
end
