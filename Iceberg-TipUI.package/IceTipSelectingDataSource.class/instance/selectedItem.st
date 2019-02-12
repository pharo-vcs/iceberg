private
selectedItem
	^ self table selectedIndexes 
		ifNotEmpty: [ :indexes | self elementAt: indexes first ]
		ifEmpty: [ nil ]