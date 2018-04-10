actions
addFilesToIndex: aCollection
	| gitIndex |
	gitIndex := self repositoryHandle index.
	gitIndex
		addAll:
			(aCollection
				collect: [ :each | 
					self assert: each asFileReference isRelative.
					"self assert: (self location resolve: each) exists."
					each asFileReference path pathString ]
				as: Array).
	gitIndex writeToDisk