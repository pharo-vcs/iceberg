*Iceberg-GitFileTree
commitIdFor: aMCWorkingCopy ifFound: aBlockClosure 
	self allFileNames 
		detect: [ :entry | aMCWorkingCopy ancestry ancestors includes: entry info ]
		ifFound: [ :entry | aBlockClosure value: entry commitID hex ]
