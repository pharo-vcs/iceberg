"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIcebergTipUI,
	#superclass : #PackageManifest,
	#category : #'Iceberg-TipUI-Manifest'
}

{ #category : #'code-critics' }
ManifestIcebergTipUI class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#IceTipBrowser #hasSelectedItem #false)) #'2020-12-17T18:54:45.342746-03:00') )
]
