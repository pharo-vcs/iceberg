"
I'm a model to choose files.
"
Class {
	#name : #IceTipFilePresenter,
	#superclass : #IceTipLocationPresenter,
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #actions }
IceTipFilePresenter >> chooseReference [

	^ (UIManager default 
		chooseFullFileName: self chooseTitle extensions: nil path: self location preview: nil)
		ifNotNil: [ :file | file asFileReference  ]
]
