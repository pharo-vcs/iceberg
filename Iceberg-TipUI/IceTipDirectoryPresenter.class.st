"
I'm a model to choose directories.
"
Class {
	#name : #IceTipDirectoryPresenter,
	#superclass : #IceTipLocationPresenter,
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #actions }
IceTipDirectoryPresenter >> chooseReference [

	^ UIManager default 
		chooseDirectory: self chooseTitle 
		path: self location
]

{ #category : #layout }
IceTipDirectoryPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		vAlignCenter;
		spacing: 5;
		add: #locationInput;
		add: #chooseButton expand: false;
		yourself
]
