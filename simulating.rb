user_num = 00004

#winning numbers
winner = []
(winner << '%05i' % (rand(10)+1)).uniq! while winner.length < 5
ticket1, ticket2, ticket3, ticket4, ticket5 = winner

ticket6 = ticket1.to_i - 1
ticket7 = ticket1.to_i + 1
ticket8 = ticket2.to_i - 1
ticket9 = ticket2.to_i + 1
ticket10 = ticket3.to_i - 1
ticket11 = ticket3.to_i + 1
ticket12 = ticket1.to_i / 100
ticket13 = ticket2.to_i / 100
ticket14 = ticket3.to_i / 100
ticket15 = ticket4.to_i / 100
ticket16 = ticket5.to_i / 100
ticket17 = ticket1.to_i % 10

puts winner

#corresponding prize
if user_num == ticket1.to_i
	p1 = 400000
	puts "Ticket ##{ticket1.to_s} won #{p1} euros."
end

if user_num == ticket1.to_i
	p1 = 400000
	puts "Ticket ##{ticket1.to_s} won '€'' #{p1} euros."
end

