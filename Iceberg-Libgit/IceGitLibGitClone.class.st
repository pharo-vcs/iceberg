"
I implement the cloning by using libgit2
"
Class {
	#name : 'IceGitLibGitClone',
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
IceGitLibGitClone >> cloneRepo: repo cloneOptions: cloneOptions remainingRetries: remainingRetries [ 

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
IceGitLibGitClone >> execute [

	| repo cloneOptions checkoutOptions callbacks |
	location exists
		ifTrue: [ IceCloneLocationAlreadyExists signalFor: location ].

	[location ensureCreateDirectory.

	repo := LGitRepository on: location.
	cloneOptions := LGitCloneOptions withCredentialsProvider: (IceCredentialsProvider defaultForRemoteUrl: url).

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
IceGitLibGitClone >> location [
	^ location
]

{ #category : 'accessing' }
IceGitLibGitClone >> location: aFileReference [
	location := aFileReference
]

{ #category : 'accessing' }
IceGitLibGitClone >> url [
	^ url
]

{ #category : 'accessing' }
IceGitLibGitClone >> url: aString [ 
	url := aString
]
