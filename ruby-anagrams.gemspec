Gem::Specification.new do |gem|
  gem.name        = 'ruby-anagrams'
  gem.version     = '0.0.1'
  gem.date        = Time.now.strftime '%Y-%m-%d'
  gem.summary     = 'Ruby Anagrams'
  gem.description = 'A trie-based anagram solver.'
  gem.authors     = ["Connor Lay"]
  gem.email       = 'connor.lay@me.com'
  gem.homepage    = "https://github.com/connorlay/ruby-anagrams"
  gem.files       = ["lib/ruby-anagrams.rb", "lib/anagrams/anagrams.rb", "lib/anagrams/enumerable.rb",
                     "lib/anagrams/node.rb", "lib/anagrams/root.rb", "lib/anagrams/subtrees.rb"]
  gem.license     = 'MIT'

  gem.add_development_dependence 'rspec'
  gem.add_development_dependence 'rspec-its'
  gem.add_development_dependence 'rake'
  gem.add_development_dependence 'yard'
end
