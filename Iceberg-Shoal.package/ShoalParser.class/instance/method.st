parsing
method
	| type selector |
	
	type := self untilIncluding: '>>'.
	selector := self untilExcluding: '['.
		
	^ { 
		type trimBoth. 
		selector trimBoth 
	}