"
I'm a model to choose files.
"
Class {
	#name : 'IceTipFilePresenter',
	#superclass : 'IceTipLocationPresenter',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipFilePresenter >> chooseReference [

	^ UIManager default
		   chooseExistingFileReference: self chooseTitle
		   extensions: nil
		   path: self location
		   preview: nil
]
