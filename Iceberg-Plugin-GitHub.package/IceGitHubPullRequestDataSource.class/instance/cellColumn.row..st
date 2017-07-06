accessing
cellColumn: column row: rowIndex 
	column id = #target_url ifTrue: [ ^ self targetUrlCellColumn: column rowIndex: rowIndex ].
	column id = #state ifTrue: [ ^ self statusCellColumn: column rowIndex: rowIndex ].
	column id = #context ifTrue: [ ^ self contextCellColumn: column rowIndex: rowIndex ].
	^ super cellColumn: column row: rowIndex 