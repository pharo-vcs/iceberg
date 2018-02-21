building
ensureInNode: aNode
	
	| parentNode |
	parentNode := self parent ensureInNode: aNode.
	parentNode childAt: self name ifAbsentPut: [ self copy ]