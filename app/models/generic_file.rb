class GenericFile < ActiveFedora::Base
  include Sufia::GenericFile
  
  property :dimensions, predicate: ::RDF::URI('http://example.org/terms/dimensions'), class_name: "Dimensions"

  accepts_nested_attributes_for :dimensions

  class Dimensions < ActiveTriples::Resource
    configure type: ::RDF::URI('http://example.org/terms/dimensionSet')
    property :height, predicate: ::RDF::URI('http://example.org/terms/height')
    property :width, predicate: ::RDF::URI('http://example.org/terms/width')
    property :depth, predicate: ::RDF::URI('http://example.org/terms/depth')
  end
  
end