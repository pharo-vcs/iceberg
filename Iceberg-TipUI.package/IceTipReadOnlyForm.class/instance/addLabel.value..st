accessing
addLabel: aString value: anObject
	items at: aString put: anObject.
	self refresh