private
diffContentsLeft: leftString right: rightString
	swapSides 
		ifTrue: [ diffPanel leftText: rightString; rightText: leftString ]
		ifFalse: [ diffPanel leftText: leftString; rightText: rightString ]