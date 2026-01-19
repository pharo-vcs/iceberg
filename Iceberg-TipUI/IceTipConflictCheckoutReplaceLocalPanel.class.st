"
I'm a panel to remove a local branch that has the same name as the remote branch to checkout it.
"
Class {
	#name : 'IceTipConflictCheckoutReplaceLocalPanel',
	#superclass : 'IceTipBranchPanel',
	#instVars : [
		'title',
		'icon',
		'remoteBranch',
		'existingBranch'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'actions' }
IceTipConflictCheckoutReplaceLocalPanel >> accept [

	self executeFor: remoteBranch localBranch: existingBranch inRepository: self repository
]

{ #category : 'ui - dialogs' }
IceTipConflictCheckoutReplaceLocalPanel >> confirmDeletionOf: aBranch [

	^ SpConfirmDialog new
		  title: 'Confirm Destructive Action';
		  label: ('Are you sure you want to delete the local branch "{1}"?
This action cannot be undone and you may LOSE CODE!' format: { aBranch name });
		  openModal
]

{ #category : 'layout' }
IceTipConflictCheckoutReplaceLocalPanel >> defaultLayout [

	^ SpBoxLayout newLeftToRight yourself
		  add: self descriptionText expand: true;
		  yourself
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> descriptionText [

	^ 'This will DELETE your local branch and replace it with the remote version.

Any uncommitted changes or commits in the local branch that have not been pushed will be lost.

Only use this option if you are certain that:
- The local branch is no longer needed
- All important work has been saved elsewhere'
]

{ #category : 'action' }
IceTipConflictCheckoutReplaceLocalPanel >> executeFor: aRemoteBranch localBranch: aLocalBranch inRepository: aRepository [

	self validate.
	(self hasUncommittedChangesIn: aLocalBranch) ifTrue: [
			IceError signal: 'Cannot delete local branch: it has uncommitted changes.
Please commit or discard changes before proceeding.' ].

	aLocalBranch delete.
	^ remoteBranch repository createBranch: remoteBranch shortName inCommit: remoteBranch commit
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> existingBranch: aBranch [

	existingBranch := aBranch
]

{ #category : 'testing' }
IceTipConflictCheckoutReplaceLocalPanel >> hasUncommittedChangesIn: aBranch [

	^ aBranch repository workingCopy notNil and: [ aBranch repository workingCopy isModified ]
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> icon [

	^ self iconNamed: #smallWarning
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> remoteBranch: aRemoteBranch [

	remoteBranch := aRemoteBranch
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> repository [

	^ self model repository
]

{ #category : 'accessing' }
IceTipConflictCheckoutReplaceLocalPanel >> validate [

	(self confirmDeletionOf: existingBranch) ifFalse: [ ^ nil ]
]

{ #category : 'initialization' }
IceTipConflictCheckoutReplaceLocalPanel >> windowIcon [

	^ self icon
]

{ #category : 'initialization' }
IceTipConflictCheckoutReplaceLocalPanel >> windowTitle [

	^ 'Delete local branch and checkout remote (DANGEROUS)'
]
