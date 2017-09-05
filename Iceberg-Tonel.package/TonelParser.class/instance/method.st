parsing
method
	| type selector |
	
	type := self untilIncluding: '>>'.
	selector := self untilExcluding: '['.
	type := type trimBoth substrings: ' '.
	type size = 1 ifTrue: [ type := type copyWith: nil ].
	^ { 
		type.
		selector trimBoth 
	}