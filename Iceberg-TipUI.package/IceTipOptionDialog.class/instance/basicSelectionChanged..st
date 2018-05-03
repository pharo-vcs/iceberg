private
basicSelectionChanged: aType
	type := aType.
	aType 
		ifNotNil: [ 	
			self title: type title.
			self replacePanelWith: type ]
		ifNil: [ 
			self removeAllPanels.
			self title: self class title ]