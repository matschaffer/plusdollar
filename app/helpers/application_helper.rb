module ApplicationHelper
  def stripe_button
    javascript_include_tag 'https://button.stripe.com/v1/button.js',
      class: 'stripe-button',
      data: {
        key: Rails.configuration.stripe_public
      }
  end
end
