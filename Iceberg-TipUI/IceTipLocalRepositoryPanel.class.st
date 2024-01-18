"
I will define a repository that already exists. 

"
Class {
	#name : 'IceTipLocalRepositoryPanel',
	#superclass : 'IceTipRepositoryTypePanel',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'accessing' }
IceTipLocalRepositoryPanel class >> order [

	^ 20
]

{ #category : 'layout' }
IceTipLocalRepositoryPanel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: projectLocationLabel; add: projectLocation; nextRow ];
		yourself
]

{ #category : 'initialization' }
IceTipLocalRepositoryPanel >> iconForWindow [

	^ self iconNamed: #smallOpen
]

{ #category : 'initialization' }
IceTipLocalRepositoryPanel >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : 'testing' }
IceTipLocalRepositoryPanel >> isLocalRepository [

	^ true
]

{ #category : 'accessing' }
IceTipLocalRepositoryPanel >> location [

	^ self projectLocation location
]

{ #category : 'accessing' }
IceTipLocalRepositoryPanel >> location: aReferenceOrString [

	^ self projectLocation location: aReferenceOrString
]

{ #category : 'accessing' }
IceTipLocalRepositoryPanel >> newRepository [

	^ self application
		informUser:
		('Importing repository from {1}' format: { self location fullName })
		during: [
			IceRepositoryCreator new
				        repository: repository;
				        location: self location;
				        createRepository ].

]

{ #category : 'initialization' }
IceTipLocalRepositoryPanel >> titleForWindow [

	^ 'Import from existing clone'
]

{ #category : 'accessing' }
IceTipLocalRepositoryPanel >> validate [

	self
		assert: self location isNotNil
		description: 'Project location must exist!'.
	self
		assert: self location exists
		description: 'Project location must exist!'.
	self
		assert: (IceRepositoryCreator isGitRoot: self location)
		description: 'Project location does not seems to be a valid git repository.'
]
