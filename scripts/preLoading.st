"Unload only the baselines, so Metacello reloads the packages from the repository"
#(
	'BaselineOfLibGit'
	'BaselineOfIceberg'
)
do: [ :each |
    (each asPackageIfAbsent: [
        (each , ' not found') traceCr.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) traceCr.
                package removeFromSystem ] ]
