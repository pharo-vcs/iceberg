"
I will create the missing source subdirectory.

I'm active when: 
	- src subdirectory is not found.
"
Class {
	#name : #IceTipRepairCreateSubdirectory,
	#superclass : #IceTipRepairAction,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRepairCreateSubdirectory class >> help [
	^ 'Create a new subdirectory for the code. 

The configured source directory does not exist in the repository. 
It is possible that the directory has been deleted or never commited after creating the meta-data.

This operation will modify the state of your working copy on disk. All non-commited changes in your disk working copy that are not in the image will be lost (this can happen if you edited the repository from outside). If you want to keep them, perform a commit from outside before.'
]

{ #category : #accessing }
IceTipRepairCreateSubdirectory class >> icon [
	^ self iconNamed: #smallNew
]

{ #category : #testing }
IceTipRepairCreateSubdirectory class >> isAvailableFor: aRepository [

	^ aRepository isMissing not and: [aRepository isCodeMissing]
]

{ #category : #accessing }
IceTipRepairCreateSubdirectory class >> order [
	^ 17
]

{ #category : #accessing }
IceTipRepairCreateSubdirectory class >> title [
	^ 'Create code subdirectory'
]

{ #category : #executing }
IceTipRepairCreateSubdirectory >> basicExecute [

	self repositoryModel createSourceDirectory.
	"Force the update of the packages"
	self repository workingCopy refreshProjectFromRepository.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)
]
