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
