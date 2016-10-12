require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = "AC952f5b95ae7ed71d403af0dec9e94324"
auth_token = "34cc3ac30c00c3ee9b2fce19e562e3a7"

Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end
