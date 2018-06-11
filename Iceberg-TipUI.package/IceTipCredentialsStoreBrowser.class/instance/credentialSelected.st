accessing
credentialSelected
	| index dataSource |
	
	index := credentialsList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	dataSource := credentialsList widget dataSource.
	dataSource hasElements ifFalse: [ ^ nil ].
	^ dataSource elementAt: index