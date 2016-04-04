class Contact < ActiveRecord::Base
    belongs_to :user
    
    validates :firstname, presence: true
    validates :firstname, length: { minimum: 3 }
    
    validates :lastname, presence: true
    validates :lastname, length: { minimum: 3 }
    
    validates :relationship, presence: true
    validates :relationship, length: { minimum: 3 }
    
    validates :email, presence: true
    validates :email length: { minimum: 3 }
    
    validates :phonenumber, presence: true
    validates :phonenumber, length: { minimum: 10 }
    

    
    
end
