updating
filter
	pattern ifNil: [ ^ self ].

	table dataSource: (pattern 
		ifNotEmpty: [ initialDataSource newDataSourceMatching: (filterClass pattern: pattern) ]
		ifEmpty: [ initialDataSource ]).
	table selectRowIndexes: #().
	table dataSource expandAll.

	self isExplicite
		ifTrue: [ self resizeWidget ]