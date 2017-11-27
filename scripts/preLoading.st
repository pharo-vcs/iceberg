"Remove tonel from system (so I can reload it)"
#(
	'BaselineOfTonel'
	'BaselineOfLibGit'
	'BaselineOfIceberg') 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].
"Temporal remove of wrong tag 'Tests'"
#Iceberg asPackage removeClassTag: 'Tests'.
