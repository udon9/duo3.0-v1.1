class ScrapingSentence
  def self.sentences
    agent = Mechanize.new
    page = agent.get("https://quizlet.com/24183379/duo-30-flash-cards/")
    english_sentences = page.search(".SetPageTerm-wordText span")
    japanese_sentences = page.search(".SetPageTerm-definitionText span")

    for num in 0..559 do
      es = english_sentences[num].inner_text
      js = japanese_sentences[num].inner_text
      sentence = SentenceDatum.new(english_sentence: es, japanese_sentence: js)
      sentence.save
    end
  end
end