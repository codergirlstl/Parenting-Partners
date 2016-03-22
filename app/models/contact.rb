class Contact < ActiveRecord::Base
    belongs_to :user
    attr_accessor :first_name, :last_name, :relationship, :email, :phone_number
    
    
end
