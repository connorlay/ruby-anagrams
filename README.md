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

### Testing for string inclusion
``` ruby
root.include? "mystring"   #=> true
root.include? "skldflsjd"  #=> false
```

### Finding anagrams
``` ruby
root.anagrams "pale" #=> ["leap", "pale", "peal" "plea"]
```
Including partial anagrams:
``` ruby
  root.anagrams "pale", partial: true #=> ["ae", "al", "ale", "alp", "ape", "el", "la", "lap", "lea", "leap", "pa", "pal", "pale", "pe", "pea", "peal", "plea"]
```
You can also use "*" as a wildcard:
``` ruby
root.anagrams "b*n" #=> ["ban", "ben", "bin", "bun", "nab", "neb", "nib", "nob", "nub"]
```

