class Department < ApplicationRecord
    has_many :users, dependent: :destroy
    before_save { name.upcase! }
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
