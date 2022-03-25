class User < ActiveRecord::Base
    has_many :todos
    validates :username, presence: true, uniqueness: true, length: {in: 3..10}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}

end