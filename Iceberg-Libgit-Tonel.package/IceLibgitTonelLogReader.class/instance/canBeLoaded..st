private
canBeLoaded: aFileReference
	^ (super canBeLoaded: aFileReference)
		and: [ aFileReference filename = self fileName ] 