class WordPlay

	def self.best_sentence(sentences, desired_words)
		ranked_sentences = sentences.sort_by do |s|
			s.words.length - (s.downcase.words - desired_words).length
		end
		ranked_sentences.last
	end

	def self.switch_pronouns(text)
		text.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
			case pronoun.downcase
			when 'i' then 'you'
      when 'you' then 'me'
      when 'me' then 'you'
			when 'i am' then 'you are'
			when 'you are' then 'i am'
			when 'your' then 'my'
			when 'my' then 'your'
			end
		end.sub(/^me\b/i, 'i')
	end

end


class String
	def sentences
		gsub(/\n|\r/, ' ').split(/\.\s*/)	# \n - newline, \r - carriage return, \s - whitespaces	
	end										# * - zero or more times, [ ] - matches a single character

	def words
		scan(/\w[\w\'\-]*/)					# %Q - double quote, %q - single quote, \w - word character [a-zA-Z0-9]
	end

end
