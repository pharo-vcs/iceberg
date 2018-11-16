actions
chooseReference
	^ (UIManager default 
		chooseFullFileName: self chooseTitle extensions: nil path: self location preview: nil)
		ifNotNil: [ :file | file asFileReference  ]