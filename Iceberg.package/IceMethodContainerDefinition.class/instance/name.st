accessing
name
	^ name , (isMeta ifTrue: [ ' class' ] ifFalse: [ '' ])