drawing
newBadgeFont
	| baseBadgeFont |
	baseBadgeFont := StandardFonts codeFont.
 	^ (LogicalFont 
		familyName: baseBadgeFont familyName 
		pointSize: baseBadgeFont pointSize - 3)
			weightValue: 700