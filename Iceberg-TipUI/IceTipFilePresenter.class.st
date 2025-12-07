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

	| reference |
	StOpenFilePresenter new
		openFolder: (self location ifNil: [ FileLocator workingDirectory ]);
		title: self chooseTitle;
		okAction: [ :directoryReference | reference := directoryReference ];
		openModal.
	^ reference
]
