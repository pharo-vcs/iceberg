"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIcebergUITests',
	#superclass : 'PackageManifest',
	#category : 'Iceberg-UI-Tests-Manifest',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestIcebergUITests class >> ruleReShouldSendSuperSetUpAsFirstMessageV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#IceTipCommitBrowserTestWithRemoteSetTest #setUp #false)) #'2026-11-27T15:39:29.55663+01:00') #(#(#RGMethodDefinition #(#IceTipWorkingCopyBrowserWithRemoteTest #setUp #false)) #'2026-11-27T15:39:35.211899+01:00') )
]
