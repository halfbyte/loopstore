Factory.define :loop do |f|
  f.name "test.nan"
  f.sequence(:message_id) {|n| "message#{n}@example.com"}
end