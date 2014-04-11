
def pic_a_word
		file = File.open("words.txt", "r")
	# file.readlines.sample
	
	file.read.split("\n").sample
	
	# file.rewind
	# puts file.readlines
end

@word = pic_a_word
@guess_word = @word.upcase.chars
@what_is_shown = (1..(@guess_word.length)).to_a.collect {|elem| "_"}

def search_word
	@guess_word.each_with_index {|letter, index| @guess_letter == letter ? @what_is_shown[index] = letter : @what_is_shown[index]}
end     

@counter = []
@guessed_letters = []

def play
	while @what_is_shown.include? "_" do
		@guess_letter = gets.chomp.upcase
		puts "please put a single letter" if @guess_letter.length > 1
		puts "you already guessed that letter!" if @guessed_letters.include?(@guess_letter)
		@guessed_letters << @guess_letter
		search_word
		@counter << 1 if !@guess_word.include?(@guess_letter) && !@guessed_letters.include?(@guess_letter)
		puts @what_is_shown.join('')	
		return puts "you're hung!\n The word was #{@word.upcase}" if @counter.length == 10
	end
	puts "you win!"	
end

play