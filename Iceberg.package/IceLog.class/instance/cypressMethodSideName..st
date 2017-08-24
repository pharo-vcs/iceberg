private
cypressMethodSideName: aMethod 
	^ aMethod origin isClassSide
		ifTrue: [ 'class' ]
		ifFalse: [ 'instance' ]