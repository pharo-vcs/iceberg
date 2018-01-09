accessing
referenceCommit: aCommit

	self packages do: [ :each | self updatePackage: each toCommit: aCommit ]