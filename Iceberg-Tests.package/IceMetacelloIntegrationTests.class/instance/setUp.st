running
setUp

	super setUp.
	
	(Iceberg remoteTypeSelector = #scpUrl
		and: [ self isCI ]) ifTrue: [ ^ self skip ].
	
	self installBaseline.