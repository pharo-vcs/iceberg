accessing
status
	"entity could be a repository or a package"
	[ ^ self computeStatus ] 
		on: Error 
		do: [ :error | ^ error description asText makeAllColor: self colorError ]

