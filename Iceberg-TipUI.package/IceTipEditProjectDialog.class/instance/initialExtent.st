api
initialExtent

	^ 
	self hasToShowWarning 
		ifTrue: [ (475@500) scaledByDisplayScaleFactor ]
		ifFalse: [  
			(475@(
				200 "Tree"
				+ (self class inputTextHeight * 3)
				+ self class buttonHeight 
				+ 50 "Yes, a magic number"
			)) scaledByDisplayScaleFactor]

