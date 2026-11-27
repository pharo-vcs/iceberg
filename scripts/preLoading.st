"Unload only the baselines, so Metacello reloads the packages from the repository"
#(
	'BaselineOfLibGit'
	'BaselineOfIceberg'
)
do: [ :each |
    (each asPackageIfAbsent: [
        (each , ' not found') traceNewLine.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) traceNewLine.
                package removeFromSystem ] ]
