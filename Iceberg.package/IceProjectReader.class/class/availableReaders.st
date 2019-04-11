instance creation
availableReaders
	^ (self allSubclasses collect: [ :each | each new ])
			sorted: [ :a :b | a priority < b priority ]