"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIcebergTipUI',
	#superclass : 'PackageManifest',
	#category : 'Iceberg-TipUI-Manifest',
	#package : 'Iceberg-TipUI',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestIcebergTipUI class >> ruleAnySatisfyRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#IceTipEditProjectDialogPresenter #guessFormatFromDirectory: #false)) #'2021-01-05T16:19:22.932793-03:00') )
]

{ #category : 'code-critics' }
ManifestIcebergTipUI class >> ruleReGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#IceTipEditProjectDialogPresenter #initializeMessagePanel #false)) #'2021-01-05T16:19:22.928248-03:00') )
]
