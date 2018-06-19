accessing
writerClass
	
	^ format = #tonel
		ifTrue: [ IceLibgitTonelWriter ]
		ifFalse: [ IceLibgitFiletreeWriter ]