testing
isValidPackageName: aString
	^ aString first isLetter
		and: [ aString first isUppercase ]