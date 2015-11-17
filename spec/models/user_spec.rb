require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "orders by email" do
    david = User.create!(email: "David@hola.com", password: "hola1234567890")
    andy = User.create!(email: "Andy@hola.com", password: "hola1234567890")

    expect(User.ordered_by_email).to eq([andy, david])
  end
end
