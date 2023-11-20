"
I will discard image changes and I will restore source from current repository HEAD.

I'm active when: 
	- working copy is detached 
	- repository HEAD is NOT detached
"
Class {
	#name : 'IceTipRepairDiscardAndLoad',
	#superclass : 'IceTipRepairAction',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing' }
IceTipRepairDiscardAndLoad class >> help [
	^ 'Discard all changes in your image and checkout the current commit (HEAD) in the repository.

This action will synchronize your image with the code in the repository.

All the changes in the image that have not been committed will be lost.

This situation happens because loaded code in your image is from a different commit than the current commit (HEAD) in the repository.

Opens a preview window with the incoming changes before doing any change.'
]

{ #category : 'accessing' }
IceTipRepairDiscardAndLoad class >> icon [
	^ self iconNamed: #refresh
]

{ #category : 'testing' }
IceTipRepairDiscardAndLoad class >> isAvailableFor: aRepository [
	"matches if: 
		- workingCopy is detached
		- HEAD is NOT detached"

	^ aRepository isMissing not  
		and: [ aRepository workingCopy isDetached 
		and: [ aRepository head isDetached not ] ]
]

{ #category : 'accessing' }
IceTipRepairDiscardAndLoad class >> order [
	^ 40
]

{ #category : 'accessing' }
IceTipRepairDiscardAndLoad class >> title [
	^ 'Discard image changes and load repository version'
]

{ #category : 'executing' }
IceTipRepairDiscardAndLoad >> basicExecute [
			
	(IceTipCheckoutPreviewBrowser onBranch: self repositoryModel branchModel) 
		application: context application;
		open
]

{ #category : 'private' }
IceTipRepairDiscardAndLoad >> finishSuccess [
	super finishSuccess.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)
]
