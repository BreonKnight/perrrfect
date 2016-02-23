class Combo < ActiveRecord::Base
  belongs_to :users
  belongs_to :characters
end
