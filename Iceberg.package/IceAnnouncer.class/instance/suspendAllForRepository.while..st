suspending
suspendAllForRepository: aRepository while: aBlock
	^ self 
		suspendAllMatching: [ :ann | ann appliesToRepository: aRepository ] 
		while: aBlock 