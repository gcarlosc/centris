require 'rails_helper'

describe Account, type: :model do
  describe '#web' do
    it 'valid attribute web' do
      account = create(:account, web: 'www.google.com')
      expect(account.web).to eq('http://www.google.com')
      account.update web: 'http://example.com'
      expect(account.web).to eq('http://example.com')
      account.update web: 'https://www.gmail.com'
      expect(account.web).to eq('https://www.gmail.com')
    end
  end
end
