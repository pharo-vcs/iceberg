Class {
	#name : 'IceRegistryTest',
	#superclass : 'TestCase',
	#instVars : [
		'currentRegistry'
	],
	#category : 'Iceberg-UI-Tests',
	#package : 'Iceberg-UI-Tests'
}

{ #category : 'running' }
IceRegistryTest >> setUp [
	super setUp.
	currentRegistry := IceRepository registry.
]

{ #category : 'running' }
IceRegistryTest >> tearDown [
	currentRegistry collect: [ :repo | repo ] into: IceRepository registry.
	super tearDown
]

{ #category : 'tests' }
IceRegistryTest >> testRegistryResetDoesNotThrowErrorUponOpenningWindow [
	| window |
	IceRepository reset.
	self shouldnt: [ window := IceTipRepositoriesBrowser new open. window close ] raise: SubscriptOutOfBounds
]
