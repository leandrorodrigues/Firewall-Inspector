require 'core/log_file'
module Core
class Tasks

  def self.test_file_complete(file)
    #read items
    items = get_items_of_file(file)

    #test and filter suspects
    suspects = test_items(items)

    suspects
  end

  def self.test_file_update_bots(file)
    log_suspects = test_file_complete(file)

    log_suspects.each do |log_suspect|
      origin_ip = IPAddr.new log_suspect['origin_ip']

      suspect = Suspect.where(ip: origin_ip.to_i).first
      if suspect
        suspect.hits += 1
      else
        suspect = Suspect.new
        suspect.hits = 1
        suspect.ip = origin_ip.to_i
        suspect.test_log = ''
      end

      suspect.test_log += "[#{Time.now.strftime('%F %T')}] Positive test catch: #{log_suspect['positive_test']} \n"

      suspect.save
    end
  end

  def self.get_items_of_file(file)
    logfile = LogFile.new(file)

    logfile.get_items
  end

  def self.test_items(items)
    suspects = []

    #carregar testes
    negative_tests = NegativeTest.where(:active => 1)
    positive_tests = PositiveTest.where(:active => 1)

    #TODO: fazer otimização para não fazer testes em IPs repetidos.
    items.each do |item|
      negative = false

      negative_tests.each do |test|
        #se o teste retornar o valor que ele precisa ser, pular
        if make_test(item, test.test_name) == test.result_must_be
          negative = true
        end
      end

      #skip this item if a negative test passed
      next if negative

      positive_tests.each do |test|
        #se o teste retornar o valor que ele precisa ser, incluir na lista de bots
        if make_test(item, test.test_name) == test.result_must_be
          item[:positive_test] = test.test_name
          suspects << item
        end
      end

    end

    suspects
  end

  def self.make_tests(item, tests)

    tests.each do |test|
      if !self.make_test(item, test)
        return false
      end
    end

    return true
  end

  def self.make_test(item, test)
    ('Core::Tests::' + (test + '_test').classify).constantize::test item
  end
end
end