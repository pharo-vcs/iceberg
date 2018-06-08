accessing
current
	^ CurrentStore
		ifNil: [ CurrentStore := self new
				storeFile: self storeFile;
				loadFromStore;
				yourself ]