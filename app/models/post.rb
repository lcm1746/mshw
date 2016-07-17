class Post < ActiveRecord::Base
    acts_as_votable
    has_many :comments, dependent: :destroy
    validates :subject_code, presence: true
    validates :subject_name, presence: true
    validates :option, presence: true
    validates :lecturer, presence: true
    validates :content, presence: true
    validates :rating, presence: true
end
