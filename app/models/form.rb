class Form < ApplicationRecord
  validates :firstname, presence: true
  validates :firstname, format: { with: /\A[a-zA-Z]+\z/, message: "plase enter a valid firstname" }, if: -> {firstname.present? }
  validates :lastname, presence: true
  validates :lastname, format: { with: /\A[a-zA-Z]+\z/, message: "plase enter a valid lastname" }, if: -> {lastname.present? }
  validates :gender, presence: true
  validates :gender, format: { with: /\A[a-zA-Z]+\z/, message: "plase enter a valid gender" }, if: -> {gender.present? }
  validates :birthdate, presence: true
  validates :birthdate, format: { with: /\d{4}-\d{2}-\d{2}/, message: "should be YYYY-MM-DD" }, if: -> {birthdate.present? }
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "please enter a valid email" }, if: -> {email.present? }
  validates :phonenumber, presence: true
  validates :phonenumber, format: { with: /\d{10}/, message: "should be 10 digit number" }, if: -> {phonenumber.present? }
  validates :subject, presence: true
  validates :subject, format: { with: /\A[a-zA-Z]+\z/, message: "plase enter a valid subject" }, if: -> {subject.present? }
end
