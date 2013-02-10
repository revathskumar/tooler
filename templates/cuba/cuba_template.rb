require 'cuba'

Cuba.define do

  on get do
    on root do
      res.write "%{name} authentication"
    end
  end
end
