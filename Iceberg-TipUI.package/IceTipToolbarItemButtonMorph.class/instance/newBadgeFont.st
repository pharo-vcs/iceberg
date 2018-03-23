drawing
newBadgeFont
	| baseBadgeFont |
	baseBadgeFont := Smalltalk ui theme buttonFont.
 	^ (LogicalFont 
		familyName: baseBadgeFont familyName 
		pointSize: baseBadgeFont pointSize - 3)
		forceBold