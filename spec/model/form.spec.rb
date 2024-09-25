require 'rails_helper'

RSpec.describe Form, type: :model do
  subject {
    described_class.new(
      firstname: "John",
      lastname: "Doe",
      gender: "Male",
      birthdate: "2000-01-01",
      email: "john@example.com",
      phonenumber: "1234567890",
      subject: "TestSubject"
    )
  }

  describe 'validations' do
    # ตรวจสอบการ validate firstname
    it 'is valid with a valid firstname' do
      expect(subject).to be_valid
    end

    it 'is not valid without a firstname' do
      subject.firstname = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:firstname]).to include("can't be blank")
    end

    it 'is not valid with an invalid firstname' do
      subject.firstname = "John123"
      expect(subject).to_not be_valid
      expect(subject.errors[:firstname]).to include("plase enter a valid firstname")
    end

    # ตรวจสอบการ validate lastname
    it 'is valid with a valid lastname' do
      expect(subject).to be_valid
    end

    it 'is not valid without a lastname' do
      subject.lastname = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:lastname]).to include("can't be blank")
    end

    it 'is not valid with an invalid lastname' do
      subject.lastname = "Doe123"
      expect(subject).to_not be_valid
      expect(subject.errors[:lastname]).to include("plase enter a valid lastname")
    end

    # ตรวจสอบการ validate gender
    it 'is not valid without a gender' do
      subject.gender = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:gender]).to include("can't be blank")
    end

    it 'is not valid with an invalid gender' do
      subject.gender = "123"
      expect(subject).to_not be_valid
      expect(subject.errors[:gender]).to include("plase enter a valid gender")
    end

    # ตรวจสอบการ validate birthdate
    it 'is not valid without a birthdate' do
      subject.birthdate = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:birthdate]).to include("can't be blank")
    end

    # it 'is not valid with an invalid birthdate format' do
    #   subject.birthdate = "01-01-2000"
    #   # expect(subject).to_not be_valid
    #   expect(subject.errors[:birthdate]).to include("should be YYYY-MM-DD")
    # end

    # ตรวจสอบการ validate email
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an invalid email format' do
      subject.email = "johnexample.com"
      expect(subject).to_not be_valid
      expect(subject.errors[:email]).to include("please enter a valid email")
    end

    # ตรวจสอบการ validate phonenumber
    it 'is not valid without a phonenumber' do
      subject.phonenumber = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:phonenumber]).to include("can't be blank")
    end

    it 'is not valid with an invalid phonenumber format' do
      subject.phonenumber = "12345"
      expect(subject).to_not be_valid
      expect(subject.errors[:phonenumber]).to include("should be 10 digit number")
    end

    # ตรวจสอบการ validate subject
    it 'is not valid without a subject' do
      subject.subject = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:subject]).to include("can't be blank")
    end

    it 'is not valid with an invalid subject' do
      subject.subject = "12345"
      expect(subject).to_not be_valid
      expect(subject.errors[:subject]).to include("plase enter a valid subject")
    end
  end
end
