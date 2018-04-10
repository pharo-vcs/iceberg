*Iceberg-TipUI
selectFirstVisibleRow
	^ self selectRowIndex: (container exposedRows
		ifNotEmpty: [ :rows | rows keys first ]
		ifEmpty: [ 0 ]).