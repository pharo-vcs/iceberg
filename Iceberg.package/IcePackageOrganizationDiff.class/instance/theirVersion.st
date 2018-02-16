changes
theirVersion
	
	^ (operations size > 1
		ifTrue: [ operations detect: #isAddition ]
		ifFalse: [ operations anyOne ]) definition source