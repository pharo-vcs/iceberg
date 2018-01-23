testing
isEmpty
	
	^ self elements isEmpty
		or: [ self elements allSatisfy: #isEmpty ]