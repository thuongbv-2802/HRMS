class User < ApplicationRecord
    # relation 1-n ,not require
    belongs_to :departments, optional: true 
    # method getter/setter
    attr_accessor :remember_token
    before_save { email.downcase! }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :position, presence: true, inclusion: ['admin', 'leader', 'member']
    validates :status, inclusion: [true, false]
    # validates :department_id, presence: true
    has_secure_password

    # Trả về thông báo mã băm của chuỗi đã cho.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def self.new_token
        SecureRandom.urlsafe_base64
    end

    # Return all record by search name
    def self.search_name(query)
        if query
            where('name LIKE ?', "%#{query}%")
        else
            all
        end
    end

    # Return record by department_id
    def self.search_department(department)
        where('department_id == ?', department)
    end

    # Ghi nhớ một người dùng trong cơ sở dữ liệu để sử dụng cho session
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Trả về true nếu token đã cho khớp với mã digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
      end
end
