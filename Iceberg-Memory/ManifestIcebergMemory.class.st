"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestIcebergMemory',
	#superclass : 'PackageManifest',
	#category : 'Iceberg-Memory-Manifest',
	#package : 'Iceberg-Memory',
	#tag : 'Manifest'
}

{ #category : 'meta-data - dependency analyser' }
ManifestIcebergMemory class >> manuallyResolvedDependencies [

	<ignoreForCoverage>
	^ #(#'Collections-Streams' #'Monticello-Model' #'FileSystem-Core' #'Collections-Abstract' #'Ring-Monticello')
]
