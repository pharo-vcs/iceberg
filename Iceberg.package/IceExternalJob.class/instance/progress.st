accessing
progress
	^ min >= max ifTrue: [ 1 ] ifFalse: [ (current - min) / (max - min) ]