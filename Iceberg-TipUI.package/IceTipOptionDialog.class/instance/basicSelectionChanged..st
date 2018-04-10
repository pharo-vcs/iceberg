private
basicSelectionChanged: aType
	type := aType.
	aType 
		ifNotNil: [ 	
			self replacePanelWith: type.
			self title: type title ]
		ifNil: [ 
			self removeAllPanels.
			self title: self class title ]