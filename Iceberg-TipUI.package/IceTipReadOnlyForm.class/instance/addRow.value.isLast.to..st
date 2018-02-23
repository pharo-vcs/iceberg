private
addRow: labelId value: valueId isLast: isLast to: column
	isLast
		ifTrue: [
			column 
				newRow: [ :row | 
					row 
						newColumn: labelId width: self labelWidth; 
						newColumn: valueId ] ]
		ifFalse: [  
			column 
				newRow: [ :row | 
						row 
							newColumn: labelId width: self labelWidth; 
							newColumn: valueId ]
				height: self rowHeight ]