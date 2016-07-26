module Core
class InterfaceUtils
  @@tests_folder = "#{Rails.root}/lib/core/tests/"


  def self.get_available_tests
    Dir.glob("#{@@tests_folder}*")
        .collect{ |file_path| File.basename(file_path, '_test.rb') }
        .reject { |t| t == 'origin'}
  end
end
end
