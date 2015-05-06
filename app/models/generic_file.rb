class GenericFile < ActiveFedora::Base
  include Sufia::GenericFile
  
  has_and_belongs_to_many :dimensions, predicate: ::RDF::URI('http://example.org/terms/dimensions'), class_name: "Dimensions"

  accepts_nested_attributes_for :dimensions

  def init_with_resource(rdf_resource)
   super(rdf_resource)
   self.dimensions = [Dimensions.new] unless !self.dimensions.empty?
   self
  end
  
  def save(arg = {})
    self.dimensions.each do |dimension|
      dimension.save!
    end
    super(arg)
  end
  
  def attributes=(attrs)
    if !attrs.nil?
      values = attrs[:dimensions]
      if !values.nil?
        if self.dimensions.nil?
          dim = Dimensions.new
          self.dimensions = [dim]
        end
        values.each do |key, value|
          self.dimensions.first.send(key.to_s + '=', value)
        end
        attrs.delete :dimensions
      end
     end
     super
  end
  
end