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
    file = File.open("lottery.txt", "w+")
    file.puts "Lottery no,Serial No.,Person"
    max_num = rand(9999)
    (1..max_num).each do |no|
      lottery = '%05i' % (rand(9999)+1)
      serial  = '%03i' % (rand(179)+1)
      person  = "Person_#{lottery}_#{serial}"
      file.puts lottery + "," + serial + "," + person
    end
  end

  def task_a
    file = File.open("lottery.txt")
    count = 0
    File.open("lottery.txt", "r").each_with_index do |row, index|
      if index.to_i > 0
        # a = row.split(",")
        # puts a[0] + " - " + a[1]
        count += 1
      end
    end
    puts "Total Lottery sold are: #{count.to_s} "
  end

  def simulator
    winner = []
    (winner << '%05i' % (rand(9999)+1)).uniq! while winner.length < 5
    ticket1, ticket2, ticket3, ticket4, ticket5 = winner  # get the array for the winner number

    winner << ticket6 = ticket1.to_i - 1 #1st consolation number
    winner << ticket7 = ticket1.to_i + 1 #1st consolation number
    winner << ticket8 = ticket2.to_i - 1 #2nd consolation number
    winner << ticket9 = ticket2.to_i + 1 #2nd consolation number
    winner << ticket10 = ticket3.to_i - 1 #3rd consolation number
    winner << ticket11 = ticket3.to_i + 1 #3rd consolation number
    winner << ticket12 = /[0-9]{3}/.match(ticket1).to_s #centena_prize
    winner << ticket13 = /[0-9]{3}/.match(ticket2).to_s #centena_prize
    winner << ticket14 = /[0-9]{3}/.match(ticket3).to_s #centena_prize
    winner << ticket15 = /[0-9]{3}/.match(ticket4).to_s #centena_prize
    winner << ticket16 = /[0-9]{3}/.match(ticket5).to_s #centena_prize
    winner << ticket17 = (ticket1.to_i % 10).to_s
    return winner
  end
  def task_b_c_d
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
    hash_winner = Hash.new
    winner = simulator()

    puts winner.inspect
    winner.each_with_index do |win, ind|
      arr_winner = []
      File.open("lottery.txt", "r").each_with_index do |row, index|
        if index.to_i > 0
          a = row.split(",")
          person = a[2].gsub("\n", "")
          if ind.to_i <= 10
            if win.to_s == a[0].to_s
              arr_winner << person
              hash_winner["#{ind.to_i + 1}"] = arr_winner
            end
          end
          if ind.to_i > 10 && ind.to_i <= 15
            win_lottery = win.to_s
            if win_lottery == /[0-9]{3}/.match(a[0]).to_s
              arr_winner << person
              hash_winner["#{ind.to_i + 1}"] = arr_winner
            end
          end
          if ind.to_i > 15
            win_lottery = win.to_s
            if win_lottery.to_s == /[0-9]{1}$/.match(a[0]).to_s
              arr_winner << person
              hash_winner["#{ind.to_i + 1}"] = arr_winner
            end
          end
        end
      end
    end
    #puts hash_winner.inspect
    puts "1st prize number is: #{winner[0]} and the winner(s): #{hash_winner["1"]}"
    sleep(1)
    puts "2nd prize number is: #{winner[1]} and the winner(s): #{hash_winner["2"]}"
    sleep(1)
    puts "3rd prize number is: #{winner[2]} and the winner(s): #{hash_winner["3"]}"
    sleep(1)
    puts "4th prize numbers are: #{winner[3]} and #{winner[4]} and the winner(s): #{hash_winner["4"]} #{hash_winner["5"]}"
    sleep(1)
    puts "1st consolation prize numbers are: #{winner[5]} and #{winner[6]} and the winner(s): #{hash_winner["1"]}"
    sleep(1)
    puts "2nd consolation prize numbers are: #{winner[7]} and #{winner[8]} and the winner(s): #{hash_winner["1"]}"
    sleep(1)
    puts "3rd consolation prize numbers are: #{winner[9]} and #{winner[10]} and the winner(s): #{hash_winner["1"]}"
    sleep(1)
    puts "centena prize numbers are: #{winner[11]}, #{winner[12]}, #{winner[13]}, #{winner[14]} and #{winner[15]} and the winner(s): #{hash_winner["1"]}"
    sleep(1)
    puts "reintegro prize number is: #{winner[16]} and the winner(s): #{hash_winner["17"]}"
  end
end
#Lottery.create_lottery
a = Lottery.new
a.task_a
a.task_b_c_d