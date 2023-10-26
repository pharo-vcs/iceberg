"
I'm a model to choose directories.
"
Class {
	#name : 'IceTipDirectoryPresenter',
	#superclass : 'IceTipLocationPresenter',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipDirectoryPresenter >> chooseReference [

	^ UIManager default 
		chooseDirectory: self chooseTitle 
		path: self location
]
