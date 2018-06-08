private - lookup
lookup: aHostName in: dict ifAbsent: aBlock

	self loadFromStore.
	^ dict at: aHostName ifAbsent: aBlock