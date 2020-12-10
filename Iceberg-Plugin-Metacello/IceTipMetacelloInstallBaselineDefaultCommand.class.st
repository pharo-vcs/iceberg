"
I'm a command to install a baseline (default group)
"
Class {
	#name : #IceTipMetacelloInstallBaselineDefaultCommand,
	#superclass : #IceTipMetacelloInstallBaselineCommand,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #accessing }
IceTipMetacelloInstallBaselineDefaultCommand class >> defaultName [

	^ 'Install baseline (default)'
]

{ #category : #execution }
IceTipMetacelloInstallBaselineDefaultCommand >> execute [

	self installBaseline: self package
]
