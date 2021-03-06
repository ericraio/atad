require "rails_helper"

RSpec.describe TipMailer, type: :mailer do
  describe "daily" do
    let(:mail) { TipMailer.daily }

    it "renders the headers" do
      expect(mail.subject).to eq("Daily")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "weekly" do
    let(:mail) { TipMailer.weekly }

    it "renders the headers" do
      expect(mail.subject).to eq("Weekly")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
