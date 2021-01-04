"
I'm a command to enable the filetree to tonel conversion.
I will be active in repository list browser, when repository is in filetree format.

"
Class {
	#name : #IceFiletreeToTonelCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-Plugin-Migration'
}

{ #category : #accessing }
IceFiletreeToTonelCommand class >> defaultName [

	^ 'Convert repository sources to tonel'
]

{ #category : #testing }
IceFiletreeToTonelCommand >> canBeExecuted [

	| repository |
	self hasRepository ifFalse: [ ^ false ].

	repository := self repository.
	^ repository isMissing not 
		and: [ repository workingCopy isDetached not
			and: [ repository workingCopy writerClass id = #filetree
				and: [ repository head isUnbornBranch not ] ] ]

]

{ #category : #execution }
IceFiletreeToTonelCommand >> execute [

	(IceTipFiletreeToTonelDialog on: self repository) openDialogWithSpec
]
