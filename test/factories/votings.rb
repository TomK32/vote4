
Factory.define :voting do |voting|
  voting.question 'This is a question?'
  voting.user User.first
end
