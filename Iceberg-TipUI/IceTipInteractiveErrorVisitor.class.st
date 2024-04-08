"
I'm a visitor to provide users with an interactive way to react to iceberg errors.

"
Class {
	#name : 'IceTipInteractiveErrorVisitor',
	#superclass : 'IceErrorVisitor',
	#instVars : [
		'context',
		'repository'
	],
	#category : 'Iceberg-TipUI-Exceptions',
	#package : 'Iceberg-TipUI',
	#tag : 'Exceptions'
}

{ #category : 'instance creation' }
IceTipInteractiveErrorVisitor class >> newContext: aContext [

	^ self newContext: aContext repository: nil
]

{ #category : 'instance creation' }
IceTipInteractiveErrorVisitor class >> newContext: aContext repository: aModel [

	^ self new 
		context: aContext;
		repository: aModel;
		yourself
]

{ #category : 'instance creation' }
IceTipInteractiveErrorVisitor class >> on: aModel [
	^ self new repository: aModel
]

{ #category : 'accessing' }
IceTipInteractiveErrorVisitor >> context [

	^ context
]

{ #category : 'accessing' }
IceTipInteractiveErrorVisitor >> context: anObject [

	context := anObject
]

{ #category : 'accessing' }
IceTipInteractiveErrorVisitor >> repository [
	^ repository
]

{ #category : 'accessing' }
IceTipInteractiveErrorVisitor >> repository: anObject [
	repository := anObject
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitAuthenticationError: anError [
 
	context application newInform
		label: anError messageText;
		title: 'Iceberg authentication Error';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitCheckoutConflict: anError [

	context application
		label: anError messageText;
		title: 'Iceberg conflicts while checking out';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitCloneLocationAlreadyExists: anError [

	context application
		label:
		('The clone location {1} already exists' format:
			 { anError location });
		title: 'Clone action failed';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitCloneRemoteNotFound: anError [

	context application newInform
		label: ('The clone remote {1} could not been found' format:
				 { anError remoteUrl });
		title: 'Clone action failed';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitExperimentalFeature: aWarning [

	| proceed |
	proceed := context application newConfirm
		           label: aWarning messageText;
		           title: 'Warning!';
		           acceptLabel: 'Continue';
		           cancelLabel: 'Cancel';
					openModal.
	proceed ifFalse: [ ^ self ].
	aWarning resume
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitGenericError: anError [
	
	(IceTipErrorDialogPresenter 
		newApplication: context application 
		model: anError) 
		asModalWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitMergeAborted: anError [

	context application
		label: (anError messageText ifNil: [
				 'Automatic (fast-forward) merge is not possible. 
Please perform the merge manually, then proceed with your previous operation.
WARNING: If you have external files, you may need to verify the conflicts there.' ]);
		title: 'Automatic merge failed';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitMissingCredentialsError: anError [

	((IceTipGitUsernameAndEmailDialogPresenter 
		newApplication: context application 
		model: self repository)
		onAccept: [ anError resume ];
		asModalWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitNoCommitMessage: aWarning [

	| proceed |
	proceed := context application newConfirm
		           label: aWarning messageText;
		           title: 'Warning!';
		           acceptLabel: 'Commit';
		           cancelLabel: 'Cancel';
		         		openModal.

	proceed ifFalse: [ ^ self ].
	aWarning resume
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitNoRemote: anError [

	context application 
		label: 'There are no remotes defined for this repository. 
Add one before continue.';
		title: 'Remote action failed';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitNothingToCommitError: anError [

	context application newInform
		title: 'There is nothing to commit.';
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitRemoteAlreadyExistError: anError [

	context application newInform
		title:
			('Remote "{1}" already exists.' format: { anError remoteName });
		openModal
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitRemoteDesynchronizedError: anError [

	| continue command |
	continue := context application newConfirm
		            label:
			            ('Your repository is out of sync with remote {1}. 
You need to pull remote changes before continue and push your changes.'
				             format: { anError remote }); 
		            title: 'Remote repository out of sync!';
		            acceptLabel: 'Pull';
		            cancelLabel: 'Cancel';
		            openModal.
	(continue isNil or: [ continue not ]) ifTrue: [ ^ self ].

	command := IcePullRemoteCommand new
		           repository: self repository;
		           remote: anError remote;
		           yourself.

	[ command executeWithContext: context ]
		on: IceMergeAborted , IceShouldCommitBeforePull
		do: [ :e |
			self flag: #pharoTodo. "Refactor this"
			(e isKindOf: IceShouldCommitBeforePull)
				ifTrue: [ e resume ]
				ifFalse: [ e acceptError: self ] ].

	command isSuccess ifFalse: [ ^ self ].
	anError isResumable ifTrue: [ ^ anError resume ].
	anError retry
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitShouldCommitBeforePullError: anError [

	| continue |
	continue := context application newConfirm
		            label: 
			            'Your repository has uncommitted changes. Merging incoming commits will change
your current working copy and your current state will not be recoverable. 
We recommend that you commit first and then pull incoming changes again.';
		            title: 'You might loose your current changes!';
		            acceptLabel: 'Proceed anyway';
		            cancelLabel: 'Cancel';
						openModal.
	continue ifFalse: [ ^ self ].
	anError resume
]

{ #category : 'visiting' }
IceTipInteractiveErrorVisitor >> visitWorkingCopyDesynchronizedError: anError [
	| solveStrategy command |

	solveStrategy := UIManager default 
		chooseFrom: #(
			'Create new branch and commit' 
			'Merge local copy into image and commit')		
		values: { 
			IceCreateBranchCommand. 
			IceMergeWorkingCopyCommand }
		message: 'Your loaded code is not synchronized with the local sources in your repository. 
You need to solve this problem before you continue, please choose one of the strategies below.'
		title: 'Loaded code out of sync!'.
	solveStrategy ifNil: [ ^ self ].
	(command := solveStrategy new) 
		repository: self repository;
		executeWithContext: context.
	command isSuccess 
		ifTrue: [ anError retry ]
]
