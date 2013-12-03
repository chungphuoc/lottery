class Lottery
  lottery_price   = 20
  first_prize     = 4000000
  second_prize    = 1250000
  third_prize     = 500000
  fourth_prize    = 200000
  consolation1    = 20000
  consolation2    = 12500
  consolation3    = 9600
  centena_prize   = 1000
  reintegro_prize = 200

  def self.create_lottery
    file = File.open("number.txt", "w+")
    file.puts "Lottery no,Serial No."
    max_num = rand(9999)
    (1..max_num).each do |no|
      (winner = '%05i' % (rand(9999)+1))
      (serial = '%03i' % (rand(179)+1))
      file.puts winner + "," + serial
    end
  end

  def task_a
    file = File.open("number.txt")
    count = 0
    File.open("number.txt", "r").each_with_index do |row, index|
      if index.to_i > 0
        # a = row.split(",")
        # puts a[0] + " - " + a[1]
        count += 1
      end
    end
    puts " Total Lottery sold are: #{count.to_s} "
  end

  def task_b
    puts "The lottery is running please wait for....."
    sleep(1)
    puts "5..."
    sleep(1)
    puts "4..."
    sleep(1)
    puts "3..."
    sleep(1)
    puts "2..."
    sleep(1)
    puts "1..."
    sleep(1)
    puts "Here is the results:"
    winner = []
    (winner << '%05i' % (rand(9999)+1)).uniq! while winner.length < 5
    ticket1, ticket2, ticket3, ticket4, ticket5 = winner  # get the array for the winner number
    ticket6 = ticket1.to_i - 1 #1st consolation number
    ticket7 = ticket1.to_i + 1 #1st consolation number
    ticket8 = ticket2.to_i - 1 #2nd consolation number
    ticket9 = ticket2.to_i + 1 #2nd consolation number
    ticket10 = ticket3.to_i - 1 #3rd consolation number
    ticket11 = ticket3.to_i + 1 #3rd consolation number
    ticket12 = (ticket1.to_i / 100).to_s #centena_prize
    ticket13 = (ticket2.to_i / 100).to_s #centena_prize
    ticket14 = (ticket3.to_i / 100).to_s #centena_prize
    ticket15 = (ticket4.to_i / 100).to_s #centena_prize
    ticket16 = (ticket5.to_i / 100).to_s #centena_prize
    ticket17 = ticket1.to_i % 10

    puts "1st prize number is: #{ticket1}"
    # sleep(1)
    puts "2nd prize number is: #{ticket2}"
    # sleep(1)
    puts "3rd prize number is: #{ticket3}"
    # sleep(1)
    puts "4th prize number is: #{ticket1}"
    # sleep(1)
    puts "1st consolation prize numbers are: #{ticket6} and #{ticket7} "
    # sleep(1)
    puts "2nd consolation prize numbers are: #{ticket8} and #{ticket9}"
    # sleep(1)
    puts "3rd consolation prize numbers are: #{ticket10} and #{ticket11}"
    # sleep(1)
    puts "centena prize numbers are: #{ticket12}, #{ticket13}, #{ticket14}, #{ticket15} and #{ticket16}"
    # sleep(1)
    puts "reintegro prize number is: #{ticket17}"
  end
end
a = Lottery.new
a.task_b