*Iceberg-TipUI
selectFirstVisibleRow
	^ self
		selectIndex:
			(container exposedRows
				ifNotEmpty: [ :rows | rows keys first ]
				ifEmpty: [ 0 ])