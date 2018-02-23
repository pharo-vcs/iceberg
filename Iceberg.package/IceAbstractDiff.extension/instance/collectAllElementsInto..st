as yet unclassified
collectAllElementsInto: aCollection
	aCollection addAll: self elements.
	self elements do: [ :each | each collectAllElementsInto: aCollection ].
	^ aCollection	