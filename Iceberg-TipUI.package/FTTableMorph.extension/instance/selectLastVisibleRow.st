*Iceberg-TipUI
selectLastVisibleRow
	^ self selectIndex: (container exposedRows
		ifNotEmpty: [ :rows | rows keys last ]
		ifEmpty: [ 0 ]).