"
Command that opens a Repository Browser on the selected commit.
"
Class {
	#name : 'IceTipBrowseCommitCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipBrowseCommitCommand class >> defaultName [

	^ 'Browse commit'
]

{ #category : 'execution' }
IceTipBrowseCommitCommand >> commit [

	^ self item commit
]

{ #category : 'executing' }
IceTipBrowseCommitCommand >> execute [

	IceTipRepositoryBrowser openOnCommit: self commit
]
