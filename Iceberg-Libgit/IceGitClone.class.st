Class {
	#name : 'IceGitClone',
	#superclass : 'Object',
	#instVars : [
		'location',
		'url'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'private - operations' }
IceGitClone >> cloneRepo: repo cloneOptions: cloneOptions remainingRetries: remainingRetries [ 

	[repo clone: url options: cloneOptions] 
		on: LGit_GIT_ERROR 
		do: [ :error | 
			(error object = LGitErrorTypeEnum giterr_net and: [remainingRetries > 1])
				ifTrue: [ 
					location ensureDeleteAll.
					self cloneRepo: repo cloneOptions: cloneOptions remainingRetries: remainingRetries - 1   ] 
				ifFalse: [ error pass ] ].

]

{ #category : 'actions' }
IceGitClone >> execute [

	| repo cloneOptions checkoutOptions callbacks |
	location exists
		ifTrue: [ IceCloneLocationAlreadyExists signalFor: location ].

	[location ensureCreateDirectory.

	repo := LGitRepository on: location.
	cloneOptions := repo cloneOptionsStructureClass withCredentialsProvider: (IceCredentialsProvider defaultForRemoteUrl: url).

	Iceberg configureLGitProxyOpt: cloneOptions fetchOptions proxyOptions.

	"Keeping references, because if not the GC take them."
	checkoutOptions := cloneOptions checkoutOptions.
	callbacks := cloneOptions fetchOptions callbacks.
	callbacks transferProgress: IceGitTransferProgress new.

	checkoutOptions checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force.
	checkoutOptions progressCallback: IceGitCheckoutProgress new.

	self cloneRepo: repo cloneOptions: cloneOptions remainingRetries: 3.

	(LGitRemote of: repo named: 'origin')
		lookup;
		setUrl: url.

	] on: LGitCallReturnHandler , IceWrongUrl do: [ :error |
		location exists ifTrue: [ location ensureDeleteAll ].
		error acceptError: (IceLibgitErrorVisitor onContext: self) ]
]

{ #category : 'accessing' }
IceGitClone >> location [
	^ location
]

{ #category : 'accessing' }
IceGitClone >> location: aFileReference [
	location := aFileReference
]

{ #category : 'accessing' }
IceGitClone >> url [
	^ url
]

{ #category : 'accessing' }
IceGitClone >> url: aString [ 
	url := aString
]
