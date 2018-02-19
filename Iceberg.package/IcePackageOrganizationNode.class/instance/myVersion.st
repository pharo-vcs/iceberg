changes
myVersion
	
	^ (operations size > 1
		ifTrue: [ operations detect: #isRemoval ]
		ifFalse: [ operations anyOne ]) definition source