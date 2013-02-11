require 'cuba'

Cuba.define do

  on get do
    on root do
      res.write "%{name}"
    end
  end
end
