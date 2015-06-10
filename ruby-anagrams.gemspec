Gem::Specification.new do |gem|
  gem.name        = 'ruby-anagrams'
  gem.version     = '0.0.2'
  gem.date        = Time.now.strftime '%Y-%m-%d'
  gem.summary     = 'Ruby Anagrams'
  gem.description = 'A trie-based anagram solver.'
  gem.authors     = ["Connor Lay"]
  gem.email       = 'connor.lay@me.com'
  gem.homepage    = "https://github.com/connorlay/ruby-anagrams"
  gem.files       = ["lib/ruby-anagrams.rb", "lib/anagrams/anagrams.rb", "lib/anagrams/enumerable.rb",
                     "lib/anagrams/node.rb", "lib/anagrams/root.rb", "lib/anagrams/subtrees.rb",
                     "lib/anagrams/string_to_symbol_array.rb"]
  gem.license     = 'MIT'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
end
