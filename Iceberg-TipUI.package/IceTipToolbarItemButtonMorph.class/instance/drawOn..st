drawing
drawOn: aCanvas
	super drawOn: aCanvas.
	self hasBadge
		ifTrue: [ self drawBadgeOn: aCanvas ]