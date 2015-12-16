module Randomid
  class Railtie < Rails::Railtie
    initializer 'randomid.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end
