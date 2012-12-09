module ApplicationHelper
  def stripe_button
    if Rails.env.test?
      submit_tag "Create Pledge"
    else
    javascript_include_tag "https://button.stripe.com/v1/button.js",
      class: "stripe-button",
      data: { key: Rails.configuration.stripe_public }
    end
  end
end
