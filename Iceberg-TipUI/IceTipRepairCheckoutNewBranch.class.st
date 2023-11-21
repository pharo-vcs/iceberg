"
I will perform a checkout of a new branch starting from the current reference commit. 
This way, by changing the HEAD into something that fits the image, my repository will be attached and repository will be able to perform commits and all regular operations.

I'm active when: 
	- working copy is detached 
	- repository HEAD is detached
"
Class {
	#name : 'IceTipRepairCheckoutNewBranch',
	#superclass : 'IceTipRepairAction',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing' }
IceTipRepairCheckoutNewBranch class >> help [
	^ 'It creates a new branch from the commit your image is pointing to.
This will not lose any change in the image.

This situation happens because the code loaded in your image does not correspond with the status of your repository.

This operation will modify the state of your working copy on disk. All non-committed changes in your disk working copy that are not in the image will be lost (this can happen if you edited the repository from outside). If you want to keep them, perform a commit from outside before.'
]

{ #category : 'accessing' }
IceTipRepairCheckoutNewBranch class >> icon [
	^ self iconNamed: #smallNew
]

{ #category : 'testing' }
IceTipRepairCheckoutNewBranch class >> isAvailableFor: aRepository [
	"matches if: 
		- workingCopy is detached
		- HEAD is detached"
	
	aRepository isMissing ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isUnknownCommit ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isNoCommit ifTrue: [ ^ false ].
	
	^ aRepository workingCopy isDetached or: [ aRepository head isDetached ]
]

{ #category : 'accessing' }
IceTipRepairCheckoutNewBranch class >> order [
	^ 10
]

{ #category : 'accessing' }
IceTipRepairCheckoutNewBranch class >> title [
	^ 'Create a new branch pointing to your image commit'
]

{ #category : 'executing' }
IceTipRepairCheckoutNewBranch >> basicExecute [
	"Fetching remotes is necessary in case the current image commit is not in the repository.
	Could be optimized"

	self fetchAllRemotes.
	((IceTipCheckoutBranchDialog 
		newApplication: context application 
		model: self repositoryModel)
		withOnlyNewBranch;
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]
