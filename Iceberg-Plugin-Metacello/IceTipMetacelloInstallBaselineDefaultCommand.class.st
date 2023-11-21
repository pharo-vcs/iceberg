"
I'm a command to install a baseline (default group)
"
Class {
	#name : 'IceTipMetacelloInstallBaselineDefaultCommand',
	#superclass : 'IceTipMetacelloInstallBaselineCommand',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'accessing - defaults' }
IceTipMetacelloInstallBaselineDefaultCommand class >> defaultName [

	^ 'Install baseline (default)'
]

{ #category : 'executing' }
IceTipMetacelloInstallBaselineDefaultCommand >> execute [

	self installBaseline: self package
]
