api
title
	^ model isCurrent
		ifTrue: [ 'Current Iceberg credentials' ]
		ifFalse: [ 'Credentials of ' , model printString ]