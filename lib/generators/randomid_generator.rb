class RandomidGenerator < Rails::Generators::Base
  argument :model, type: :string
  argument :attribute, type: :string
  argument :length, type: :string

  def add_attribute
    generate 'migration', "add_#{attribute}_to_#{model} #{attribute}:string"
  end

  def add_unique_identifier
    inject_into_file "app/models/#{model}.rb", "  unique_identifier :#{attribute}, #{length.to_i}\n", after: "class #{model.capitalize} < ActiveRecord::Base\n"
  end
end
