
module Randomid
  module ModelAdditions

    def unique_identifier(attribute, length=16)
      before_create do 
        loop do
          token = Randomid.generate_uid(length)
          break send("#{attribute}=", token) unless self.class.exists?("#{attribute}" => token)
        end
      end
    end


  end
end
