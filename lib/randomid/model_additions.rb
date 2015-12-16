
module Randomid
  module ModelAdditions

    def unique_identifier(attribute, length=16)
      before_create do 
        send("#{attribute}=", Randomid.generate_uid(length))
      end
    end


  end
end
      #object.uid = loop do
      #  token = SecureRandom.urlsafe_base64(16)
      #  break token unless object.class.exists?("#{attribute}" => token)
      #end
