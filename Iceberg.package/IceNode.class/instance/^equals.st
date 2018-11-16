comparing
= anotherNode

	^ (self basicEqualsTo: anotherNode)
		and: [ self children asSet = anotherNode children asSet ]