if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_qKRTnpnTUgthh1zj9H10wv10',
    :secret_key => 'sk_test_9MhteXJqLXNpPsXtoj5egJT5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]