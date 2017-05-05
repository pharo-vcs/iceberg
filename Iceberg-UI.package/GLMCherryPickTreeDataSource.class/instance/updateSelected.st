updating
updateSelected
	selection := self glamourPresentation cherryPick 
		ifNotNil: [ :valuable | valuable value ]
		ifNil: [ Set new ]