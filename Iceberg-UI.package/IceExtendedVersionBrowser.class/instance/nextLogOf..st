private
nextLogOf: log
	^ self history 
		after: log 
		ifAbsent: [ nil ]