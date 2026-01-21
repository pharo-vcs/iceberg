"
I am a class to hold the settings of the different operations.
I am a singleton, and I am integrated with the settings framework.
"
Class {
	#name : 'IceGitOperationSettings',
	#superclass : 'Object',
	#instVars : [
		'cloneOperationClass',
		'fetchOperationClass',
		'pushOperationClass'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'private - operations' }
IceGitOperationSettings class >> checkUnixSubprocessLib [

	self environment at: #OSSUnixSubprocess ifAbsent: [
			Metacello new
				baseline: 'OSSubprocess';
				repository: 'github://pharo-contributions/OSSubprocess:master/repository';
				load ]
]

{ #category : 'private - operations' }
IceGitOperationSettings class >> checkWindowsSubprocessLib [

	self environment at: #OSWSWinProcess ifAbsent: [
			Metacello new
				baseline: 'OSWinSubprocess';
				repository: 'github://pharo-contributions/OSWinSubprocess:master/src';
				load ]
]

{ #category : 'settings' }
IceGitOperationSettings class >> cloneOperationClass [
	
	^ self uniqueInstance cloneOperationClass 
]

{ #category : 'private - operations' }
IceGitOperationSettings class >> ensureSubprocessLib [

	OSPlatform current isWindows 
		ifTrue: [ self checkWindowsSubprocessLib ]
		ifFalse: [ self checkUnixSubprocessLib ].

]

{ #category : 'accessing' }
IceGitOperationSettings class >> fetchOperationClass [
	
	^ self uniqueInstance fetchOperationClass 
]

{ #category : 'accessing' }
IceGitOperationSettings class >> pushOperationClass [
	
	^ self uniqueInstance pushOperationClass 
]

{ #category : 'class initialization' }
IceGitOperationSettings class >> reset [

	UniqueInstance := nil
]

{ #category : 'settings' }
IceGitOperationSettings class >> settingsOn: aBuilder [ 

	<systemsettings>
	
	(aBuilder group: #IcebergActions)
		name: 'Network Actions';
		parent: #Iceberg;
		with: [ 	
			(aBuilder button: #useLibGitOperations)
				order: 1;
				target: self uniqueInstance;
				label: 'Use All LibGit as Backend';
				buttonLabel: 'Use LibGit for All'.

			(aBuilder button: #useGitCommandLineOperations)
				order: 2;
				target: self uniqueInstance;
				label: 'Use All Git Commandline as Backend';
				buttonLabel: 'Use CommandLine for All'.

			(aBuilder pickOne: #'cloneOperationClass')
				target: self uniqueInstance;
				default: self uniqueInstance defaultCloneOperationClass;
				order: 3;
				label: 'Clone Operation Strategy';
				description: 'Clone Strategy to use';
				domainValues: {
					'Use Libgit' -> IceGitLibGitClone.
					'Use GIT external tool' -> IceGitCommandLineClone}.

			(aBuilder pickOne: #'fetchOperationClass')
				target: self uniqueInstance;
				default: self uniqueInstance defaultFetchOperationClass;
				order: 3;
				label: 'Fetch Operation Strategy';
				description: 'Fetch Strategy to use';
				domainValues: {
					'Use Libgit' -> IceGitLibGitFetch.
					'Use GIT external tool' -> IceGitCommandLineFetch}.

			(aBuilder pickOne: #'pushOperationClass')
				target: self uniqueInstance;
				default: self uniqueInstance defaultPushOperationClass;
				order: 4;
				label: 'Push Operation Strategy';
				description: 'Push Strategy to use';
				domainValues: {
					'Use Libgit' -> IceGitLibGitPush.
					'Use GIT external tool' -> IceGitCommandLinePush} 

		]

]

{ #category : 'instance creation' }
IceGitOperationSettings class >> uniqueInstance [

	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : 'accessing' }
IceGitOperationSettings >> cloneOperationClass [

	^ cloneOperationClass ifNil: [ self defaultCloneOperationClass ]


]

{ #category : 'accessing' }
IceGitOperationSettings >> cloneOperationClass: aClass [

	aClass requiresSubprocessLib ifTrue: [ self class ensureSubprocessLib ].

	cloneOperationClass := aClass

]

{ #category : 'defaults' }
IceGitOperationSettings >> defaultCloneOperationClass [

	^ IceGitLibGitClone 
]

{ #category : 'defaults' }
IceGitOperationSettings >> defaultFetchOperationClass [

	^ IceGitLibGitFetch
]

{ #category : 'defaults' }
IceGitOperationSettings >> defaultPushOperationClass [

	^ IceGitLibGitPush
]

{ #category : 'accessing' }
IceGitOperationSettings >> fetchOperationClass [

	^ fetchOperationClass ifNil: [ self defaultFetchOperationClass ]


]

{ #category : 'accessing' }
IceGitOperationSettings >> fetchOperationClass: aClass [

	aClass requiresSubprocessLib ifTrue: [ self class ensureSubprocessLib ].

	fetchOperationClass := aClass

]

{ #category : 'accessing' }
IceGitOperationSettings >> pushOperationClass [

	^ pushOperationClass ifNil: [ self defaultPushOperationClass ]
]

{ #category : 'accessing' }
IceGitOperationSettings >> pushOperationClass: aClass [

	aClass requiresSubprocessLib ifTrue: [ self class ensureSubprocessLib ].

	pushOperationClass := aClass
]

{ #category : 'operations' }
IceGitOperationSettings >> refreshSettingsBrowserIfNeeded [

	self class environment
		at: #SettingBrowser
		ifPresent: [ :settingsBrowserClass |
			settingsBrowserClass refreshAllSettingBrowsers ]
]

{ #category : 'operations' }
IceGitOperationSettings >> useGitCommandLineOperations [
		
	self class ensureSubprocessLib.
		
	cloneOperationClass := IceGitCommandLineClone.
	fetchOperationClass := IceGitCommandLineFetch.	
	pushOperationClass := IceGitCommandLinePush.
	
	self refreshSettingsBrowserIfNeeded
]

{ #category : 'operations' }
IceGitOperationSettings >> useLibGitOperations [

	cloneOperationClass := IceGitLibGitClone.
	fetchOperationClass := IceGitLibGitFetch.
	pushOperationClass := IceGitLibGitPush.	
	
	self refreshSettingsBrowserIfNeeded
]
