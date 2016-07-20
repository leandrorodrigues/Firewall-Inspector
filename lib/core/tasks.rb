require 'core/log_file'
module Core
class Tasks

  def self.readfile(file)
    logfile = LogFile.new(file)

    @bots = []

    test_items logfile.get_items

    puts @bots.inspect
  end

  def self.test_items(items)




    items.each do |item|
      #testar negativo
      negative_tests = NegativeTest.where(:active => 1)



      #testar positivo
      positive_tests = PositiveTest.where(:active => 1)


      if !self.make_tests item, ['brazil_country']
        @bots << item
      end


    end

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