accessing
traversingDo: aBlock parents: anArray
	aBlock cull: self cull: anArray.
	self children do: [ :each | 
		each 
			traversingDo: aBlock 
			parents: (anArray copyWith: self) ]