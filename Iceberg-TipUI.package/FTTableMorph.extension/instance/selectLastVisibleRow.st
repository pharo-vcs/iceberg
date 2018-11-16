*Iceberg-TipUI
selectLastVisibleRow
	^ self selectRowIndex: (container exposedRows
		ifNotEmpty: [ :rows | rows keys last ]
		ifEmpty: [ 0 ]).