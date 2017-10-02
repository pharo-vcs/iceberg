private
removeFrom: aString enclosingStart: startChar end: endChar
	^ self 
		removeFrom: aString 
		enclosingStart: startChar 
		end: endChar
		clean: #both