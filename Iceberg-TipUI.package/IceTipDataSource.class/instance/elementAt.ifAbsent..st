accessing
elementAt: aNumber ifAbsent: aBlock 
	^ self elements
		at: aNumber 
		ifAbsent: aBlock