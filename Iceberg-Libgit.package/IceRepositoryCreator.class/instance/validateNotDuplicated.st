private
validateNotDuplicated
	(self remoteToUse isNotNil
		and: [ self locationToUse exists and: [ self locationToUse hasChildren ] ])
		ifTrue: [ 
			IceDuplicatedRepository signal:
					('You already have an Iceberg repository 
at {1}. 

If you really want create another one, 
please locate it in a different directory.'
						format: {self locationToUse pathString}) ]