class Usuario < ApplicationRecord
    has_one_attached :profile_picture
    validates :login, uniqueness: true
    has_many :termos
    has_many :termos, dependent: :destroy
    validates :nome, :login, :senha, presence: true
end
