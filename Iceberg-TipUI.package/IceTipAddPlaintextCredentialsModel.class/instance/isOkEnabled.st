testing
isOkEnabled
	^ super isOkEnabled and: [ self host isNotEmpty ]