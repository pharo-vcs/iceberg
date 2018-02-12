private
addRow: labelId value: valueId isLast: isLast to: column
	isLast
		ifTrue: [
			column 
				newRow: [ :row | row newColumn: labelId width: 100; newColumn: valueId ] ]
		ifFalse: [  
			column 
				newRow: [ :row | row newColumn: labelId width: 100; newColumn: valueId ]
				height: 25 ]