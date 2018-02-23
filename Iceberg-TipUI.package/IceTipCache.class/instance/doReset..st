accessing
doReset: ann
	resetConditions keysAndValuesDo: [ :class :block |
		((ann isKindOf: class) 
			and: [ block cull: proxy realObject cull: ann ])
			ifTrue: [ 
				self reset.
				self announcer 
					ifNotNil: [ :a | a announce: IceTipCacheReseted ].
				^ self ] ]