private
parse: aString rule: rule
	| parser |
	
	parser := TonelParser on: aString readStream.
	 ^ parser perform: rule.
	