## RubyAnagrams

RubyAnagrams is a simple anagram solver built with a [trie prefix tree](http://en.wikipedia.org/wiki/Trie).

## Usage

### Require the Gem:
``` ruby
require 'ruby-anagrams'
```

### Creating a new trie

Creating an empty trie:
``` ruby
root = RubyAnagrams::Root.new
```

Creating a trie filled with strings from a text file:
``` ruby
root = RubyAnagrams::Root.new "some_text_file.txt"
```

### Adding strings
``` ruby
root << "mystring"
```
You can also use #add

### Testing for string inclusion
``` ruby
root.include? "mystring"   #=> true
root.include? "skldflsjd"  #=> false
```
You can also use #contains?

### Finding anagrams
``` ruby
root.anagrams "pale" #=> ["leap", "pale", "peal" "plea"]
```
Including partial anagrams:
``` ruby
  root.anagrams "pale", partial: true #=> ["ae", "al", "ale", "alp", "ape", "el", "la", "lap", "lea", "leap", "pa", "pal", "pale", "pe", "pea", "peal", "plea"]
```
"*" wildcards:
``` ruby
root.anagrams "b*n" #=> ["ban", "ben", "bin", "bun", "nab", "neb", "nib", "nob", "nub"]
```

