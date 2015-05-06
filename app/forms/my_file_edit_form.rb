class MyFileEditForm < MyGenericFilePresenter
  include HydraEditor::Form
  include HydraEditor::Form::Permissions

  self.required_fields = [:title, :creator, :tag, :rights]
  
   def self.build_permitted_params
     super  + [:dimensions => [:width, :height, :depth]]
  end
end