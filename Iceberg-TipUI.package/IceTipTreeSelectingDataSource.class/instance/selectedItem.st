private
selectedItem
	^ self table selectedRowIndexes 
		ifNotEmpty: [ :indexes | self elementAt: indexes first ]
		ifEmpty: [ nil ]