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

	| reference |
	StOpenDirectoryPresenter new
		openFolder:
			((self location ifNil: [ FileLocator workingDirectory ]) exists
				 ifTrue: [ self location ifNil: [ FileLocator workingDirectory ] ]
				 ifFalse: [ FileLocator imageDirectory parent ]);
		title: self chooseTitle;
		okAction: [ :directoryReference | reference := directoryReference ];
		openModal.
	^ reference
]
