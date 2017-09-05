private
parse: aString rule: rule
	| parser |
	
	parser := ShoalParser on: aString readStream.
	 ^ parser perform: rule.
	