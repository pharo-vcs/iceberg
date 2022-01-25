"
I represent an access point to the GitHub API. 
I provide different high level abstractions to interact with GitHub, following the speciphications you can find here: https://developer.github.com/v3/
"
Class {
	#name : #IceGitHubAPI,
	#superclass : #Object,
	#instVars : [
		'credentials',
		'isAnonymous',
		'acceptMediaType'
	],
	#category : #'Iceberg-Plugin-GitHub-Model'
}

{ #category : #credentials }
IceGitHubAPI class >> ensureCredentials [
	| provider |

	provider := IceCredentialsProvider defaultForHost: 'github.com'. 
	^ provider providePlaintextCredentials.
]

{ #category : #utilities }
IceGitHubAPI class >> issuesClosedOn: repoName milestone: milestone [ 
	"Answers a string with a list and description of items closed on a milestone. 
	 Used to paste it as explanations on releases, etc.
	 Example: 
	 	self issuesClosedOn: 'pharo-vcs/iceberg' milestone: '0.7.3'"
	
	| project api issues |
	
	api := self new.
	project := '/repos/', repoName.
	issues := (api get: project, '/milestones')
		detect: [ :each | (each at: 'title') = milestone ]
		ifFound: [ :each | 
			api 
				get: project, '/issues'
				parameters: { 
					'milestone' -> (each at: 'number') asString.
					'state' -> 'closed' } asDictionary ]
		ifNone: [ #() ].
	
	^ String streamContents: [ :stream |  
		issues 
			do: [ :each | 
				stream << '- #' << (each at: 'number') << ': ' << (each at: 'title').
				each 
					at: 'labels' 
					ifPresent: [ :labels | 
						stream << ' ('.
						labels 
							do: [ :eachLabel | stream << (eachLabel at: 'name') ]
							separatedBy: [ stream << ', ' ].
						stream << ')' ] ]
			separatedBy: [ stream << String lf ] ]
]

{ #category : #private }
IceGitHubAPI class >> obtainCredentials [
	| provider |
	
	"I try to get the configured credentials, if there is no, I will not attempt to get some.
	Use #ensureCredentials when really need to login."
	
	provider := IceCredentialsProvider defaultForHost: 'github.com'.
	provider plaintextCredentials isPresent ifFalse: [^ nil ].
	^ provider plaintextCredentials.

]

{ #category : #accessing }
IceGitHubAPI >> acceptMediaType [

	^ acceptMediaType ifNil: [ 
		  acceptMediaType := 'application/vnd.github.v3+json' ]
]

{ #category : #accessing }
IceGitHubAPI >> acceptMediaType: aString [
	"Set the media type to use in the request.
	See: https://developer.github.com/v3/media/"

	acceptMediaType := aString
]

{ #category : #requesting }
IceGitHubAPI >> acceptPullRequest: owner project: projectName number: aNumber data: aDictionary [
	^ self 
		put: 'repos/', owner, '/', projectName, '/pulls/', aNumber asString, '/merge'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]
]

{ #category : #requesting }
IceGitHubAPI >> addComment: owner project: projectName number: aNumber data: aDictionary [
	^ self 
		post: 'repos/', owner, '/', projectName, '/issues/', aNumber asString, '/comments'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]
]

{ #category : #requesting }
IceGitHubAPI >> addPullRequest: owner project: projectName data: aDictionary [
	^ self 
		post: 'repos/', owner, '/', projectName, '/pulls'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]
]

{ #category : #accessing }
IceGitHubAPI >> beAnonymous [

	isAnonymous := true
]

{ #category : #private }
IceGitHubAPI >> contentsWithValidationDo: aBlock [
	^ (self responseWithValidationDo: aBlock) contents
]

{ #category : #accessing }
IceGitHubAPI >> credentials [
	^ credentials ifNil: [ credentials := self class obtainCredentials ]
]

{ #category : #accessing }
IceGitHubAPI >> credentials: anObject [
	credentials := anObject
]

{ #category : #'private - requesting' }
IceGitHubAPI >> delete: aString [ 
	^ self contentsWithValidationDo: [
		(self newRequestTo: aString)
			delete;
			response ]
]

{ #category : #requesting }
IceGitHubAPI >> deleteBranch: owner project: projectName name: branchName [
	^ self delete: 'repos/', owner, '/', projectName, '/git/refs/heads/', branchName
]

{ #category : #'private - requesting' }
IceGitHubAPI >> get: aString [ 
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			get;
			response ]
]

{ #category : #'private - requesting' }
IceGitHubAPI >> get: aString parameters: aDictionary [
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString, (String streamContents: [ :stream |
				stream << '?'.
				aDictionary associations 
					do: [ :keyPair | stream << keyPair key << '=' << keyPair value ]
					separatedBy: [ stream << '&' ] ] ))
			get;
			response ]
]

{ #category : #requesting }
IceGitHubAPI >> getBranch: owner project: projectName name: branchName [
	^ self get: 'repos/', owner,'/', projectName, '/branches/', branchName
]

{ #category : #requesting }
IceGitHubAPI >> getBranches: owner project: projectName [
	^ self get: 'repos/', owner,'/', projectName, '/branches'
]

{ #category : #requesting }
IceGitHubAPI >> getCommit: aCommitish owner: owner project: projectName [ 

	^ self get: 'repos/', owner,'/', projectName, '/commits/', aCommitish
]

{ #category : #requesting }
IceGitHubAPI >> getIssue: owner project: projectName number: issueNumber [

	^ self get: 'repos/', owner,'/', projectName, '/issues/', (issueNumber asString)
]

{ #category : #'private - requesting' }
IceGitHubAPI >> getPaginated: aString [ 
	^ IceGitHubAPIPaginatedResult api: self request: aString

]

{ #category : #requesting }
IceGitHubAPI >> getPullRequests: owner project: projectName [
	^ self getPaginated: 'repos/', owner, '/', projectName, '/pulls'
		
]

{ #category : #'private - requesting' }
IceGitHubAPI >> getRaw: aString [ 
	^ self responseWithValidationDo: [
		(self newRequestTo: aString)
			get;
			response ]
]

{ #category : #requesting }
IceGitHubAPI >> getRepository: owner project: projectName [
	^ self get: 'repos/', owner,'/', projectName
]

{ #category : #requesting }
IceGitHubAPI >> getTagsOwner: owner project: project [

	 ^ self get: 'repos', '/', owner, '/', project, '/tags'
]

{ #category : #responses }
IceGitHubAPI >> handleUnauthorized: aZnResponse [ 
	"If we are in unauthorized we require the correct credentials."
	
	| newCredentials githubOtp |
	aZnResponse isSuccess ifTrue: [ ^ self ].
	aZnResponse status ~= 401 ifTrue: [ ^ self ].

	"Does this require two factor authentication now?"
	githubOtp := aZnResponse headers at: 'X-Github-Otp' ifAbsent: [ nil ].
	newCredentials := githubOtp = 'required; app'
		ifTrue: [ IcePlaintextOtpCredentials new ]
		ifFalse: [ IcePlaintextCredentials new ].
	
	"Ignoring if you press cancel"
	(IceCredentialsProvider defaultForHost: 'github.com')
		obtainCredentials: newCredentials.
	IceAuthenticationError signal: 'Retry to use the new credentials'
	
]

{ #category : #initialization }
IceGitHubAPI >> initialize [

	super initialize.
	isAnonymous := false
]

{ #category : #private }
IceGitHubAPI >> jsonContentsWithValidationDo: aBlock [

	^ STON fromString: (self contentsWithValidationDo: aBlock)
]

{ #category : #'private - factory' }
IceGitHubAPI >> newRequestTo: aString [

	^ ZnClient new 
		in: [ :this | 
			(self credentials notNil and: [ isAnonymous not]) ifTrue: [ 
				self credentials applyToRequest: this ] ]; 
		headerAt: 'Accept' put: self acceptMediaType;
		url: 'https://api.github.com/', (aString first = $/
			ifTrue: [ aString allButFirst ]
			ifFalse: [ aString ]);
		yourself
]

{ #category : #'private - requesting' }
IceGitHubAPI >> patch: aString with: aBlock [  
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			in: aBlock;
			patch;
			response ]
]

{ #category : #'private - requesting' }
IceGitHubAPI >> post: aString with: aBlock [  
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			in: aBlock;
			post;
			response ]
]

{ #category : #'requesting - gists' }
IceGitHubAPI >> postGist: descriptionString public: aBoolean files: anArrayOfAssociations [

	^ self 
		post: 'gists'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: (Dictionary new
					at: 'description' put: descriptionString;
					at: 'public' put: aBoolean;
					at: 'files' put:  (anArrayOfAssociations 
						collect: [ :each | 
							each key -> (Dictionary with: 'content' -> each value withUnixLineEndings) ] 
						as: Dictionary);
					yourself)));
				contentType: ZnMimeType applicationJson ]
]

{ #category : #'requesting - gists' }
IceGitHubAPI >> postGist: descriptionString public: aBoolean name: fileName contents: contentsString [

	^ self 
		postGist: descriptionString 
		public: aBoolean
		files: { fileName -> contentsString }
]

{ #category : #'private - requesting' }
IceGitHubAPI >> put: aString with: aBlock [  
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			in: aBlock;
			put;
			response ]
]

{ #category : #private }
IceGitHubAPI >> responseWithValidationDo: aBlock [
	| response |
	
	response := aBlock value.
	
	self handleUnauthorized: response.
	
	response isSuccess 
		ifFalse: [ IceGitHubError signalFor: response ].
	^ response
]

{ #category : #requesting }
IceGitHubAPI >> updatePullRequest: owner project: projectName number: aNumber data: aDictionary [ 
	^ self 
		patch: 'repos/', owner, '/', projectName, '/pulls/', aNumber asString
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]
]
