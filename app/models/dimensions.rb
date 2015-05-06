class Dimensions < ActiveFedora::Base
  property :height, predicate: ::RDF::URI('http://example.org/terms/height'), multiple: false
  property :width, predicate: ::RDF::URI('http://example.org/terms/width'), multiple: false
  property :depth, predicate: ::RDF::URI('http://example.org/terms/depth'), multiple: false
end