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
	
	^ self application newOpenFile 
		beOpenDirectory;
		parentWindow: self window;
		title: self chooseTitle;
		path: (self location ifNil: [ FileLocator workingDirectory ]) fullName;
		openModal
]
