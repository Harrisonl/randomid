require "randomid/version"
require "randomid/model_additions"
require 'securerandom'
require 'randomid/railtie' if defined? Rails

module Randomid

  def self.generate_uid(length=16)
    token = SecureRandom.urlsafe_base64(16)
    token.slice!(0...-length)
    token
  end

end
