private - lookup
lookup: aHostName in: dict ifAbsent: aBlock

	^ dict at: aHostName ifAbsent: aBlock