"
I test how Iceberg finds its settings among the system settings.
"
Class {
	#name : 'IcebergSettingsTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Settings',
	#package : 'Iceberg-Tests',
	#tag : 'Settings'
}

{ #category : 'tests' }
IcebergSettingsTest >> testSettingsInSelectsIcebergSettings [

	| settings |
	settings := Iceberg settingsIn: SettingsManager forSystemSettings.

	self denyEmpty: settings.
	self assert: (settings allSatisfy: [ :each | each declaration methodClass package name beginsWith: 'Iceberg' ]).
	self assert: (settings anySatisfy: [ :each | each name = #shouldGroupRepositories ])
]

{ #category : 'tests' }
IcebergSettingsTest >> testUseLibGitOperationsButton [

	| operationSettings settings previousClasses |
	settings := Iceberg settingsIn: SettingsManager forSystemSettings.
	self assert: (settings anySatisfy: [ :each | each name = #useLibGitOperations ]).
	self assert: (settings anySatisfy: [ :each | each name = #useGitCommandLineOperations ]).

	operationSettings := IceGitOperationSettings uniqueInstance.
	previousClasses := {
		                   operationSettings cloneOperationClass.
		                   operationSettings fetchOperationClass.
		                   operationSettings pushOperationClass }.
	[
	operationSettings useLibGitOperations.

	self assert: operationSettings cloneOperationClass equals: IceGitLibGitClone.
	self assert: operationSettings fetchOperationClass equals: IceGitLibGitFetch.
	self assert: operationSettings pushOperationClass equals: IceGitLibGitPush ] ensure: [
		operationSettings
			cloneOperationClass: previousClasses first;
			fetchOperationClass: previousClasses second;
			pushOperationClass: previousClasses third ]
]

