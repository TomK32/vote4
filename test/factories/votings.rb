
Factory.define :voting do |voting|
  voting.question 'This is a question?'
  voting.user Factory.create(:user)
end
