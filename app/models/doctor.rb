class Doctor < ApplicationRecord
    validates :first_name, presence: true, uniqueness: true, length:{ maximum:100 }
    
end
