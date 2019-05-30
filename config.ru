require_relative 'lib/redirect'

run Redirect.new(
  target: ENV.fetch('REDIRECT_TARGET'),
  status: ENV.fetch('REDIRECT_STATUS') { 302 }
)
