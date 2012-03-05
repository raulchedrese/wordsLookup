require 'json'


get '/' do
  erb :index
end

  def filterFirstLetter(words, firstLetter)
    results = Array.new
    regex = "^#{firstLetter}.+"
    words.each do |word|
      if word =~ /#{regex}/
        results << word.chomp
      end
    end
    return results
  end

  def filterNumLetters(words, numLetters)
    results = Array.new
    regex = "^"
    numLetters.times { regex += "." }
    regex += "$"
    words.each do |word|
      if word =~ /#{regex}/
        results << word.chomp
      end
    end
    return results
  end

  def filterContainsLetter(words, cLetter)
    results = Array.new
    regex = "#{cLetter}"
    words.each do |word|
      if word =~ /#{regex}/
        results << word.chomp
      end
    end
    return results
  end

  def filterLastLetter(words, lastLetter)
    results = Array.new
    regex = ".+#{lastLetter}$"
    words.each do |word|
      if word =~ /#{regex}/
        results << word.chomp
      end
    end
    return results
  end

get '/json' do
  
  # command line code
  # puts "Number of letters in word:"
  # numLetters = gets.chomp
  # numLetters = numLetters.to_i
  # numLetters -= 1
  # 
  # puts "First Letter:"
  # fLetter = gets.chomp
  # 
  # puts "Contains Letter:"
  # cLetter = gets.chomp
  
  
  if !params[:numLetters].nil?
    numLetters = params[:numLetters]
  end
  
  if !params[:firstLetter].nil?
    fLetter = params[:firstLetter]
  end
  
  if !params[:cLetter].nil?
    cLetter = params[:cLetter]
  end
  
  if !params[:lastLetter].nil?
    lastLetter = params[:lastLetter]
  end


  @results = File.readlines("words")


  if numLetters != ""
    numLetters = numLetters.to_i
    @results = filterNumLetters(@results, numLetters)
  end

  if fLetter != ""
    fLetter = fLetter
    @results = filterFirstLetter(@results, fLetter)
  end

  if cLetter != ""
    cLetter = cLetter
    @results = filterContainsLetter(@results, cLetter)
  end

  if lastLetter != ""
    lastLetter = lastLetter
    @results = filterLastLetter(@results, lastLetter)
  end

  @results.to_json

  # do the regex multiple time to check for letters. each time reduce list by checking for another letter.
  #erb :index
end


get '/hi' do
  
  # command line code
  # puts "Number of letters in word:"
  # numLetters = gets.chomp
  # numLetters = numLetters.to_i
  # numLetters -= 1
  # 
  # puts "First Letter:"
  # fLetter = gets.chomp
  # 
  # puts "Contains Letter:"
  # cLetter = gets.chomp

  
  if !params[:numLetters].nil?
    numLetters = params[:numLetters]
  end
  
  if !params[:firstLetter].nil?
    fLetter = params[:firstLetter]
  end
  
  if !params[:cLetter].nil?
    cLetter = params[:cLetter]
  end
  
  if !params[:lastLetter].nil?
    lastLetter = params[:lastLetter]
  end


  @results = File.readlines("words")


  if numLetters != ""
    numLetters = numLetters.to_i
    @results = filterNumLetters(@results, numLetters)
  end

  if fLetter != ""
    @results = filterFirstLetter(@results, fLetter)
  end

  if cLetter != ""
    @results = filterContainsLetter(@results, cLetter)
  end

  if lastLetter != ""
    @results = filterLastLetter(@results, lastLetter)
  end

  erb :index

  # do the regex multiple time to check for letters. each time reduce list by checking for another letter.
  #erb :index
end



