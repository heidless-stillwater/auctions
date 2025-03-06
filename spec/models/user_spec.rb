require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(password: "Anything",
                        email: "Lorem ipsum"
                      )
  }

  describe "Validations" do 

    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a password" do 
      subject.password = nil
      expect(subject).to be_invalid
    end
  

    it "is not valid without a email" do 
      subject.email = nil
      expect(subject).to be_invalid
    end
  


  end
end
