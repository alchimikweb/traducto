#*************************************************************************************
# Methods that will be inserted in the ActionView.
#*************************************************************************************
module Traducto::Helpers
  def t(key, options={})
    @traducto ||= Traducto::Base.new(self)

    return @traducto.translate(key, options)
  end

  ::ActionView::Base.send :include, self
end
