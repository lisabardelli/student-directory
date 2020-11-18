def read_its_own_source
    filename = __FILE__
    File.readlines(filename).each do |line|
      puts line
    end
  end
  
  read_its_own_source