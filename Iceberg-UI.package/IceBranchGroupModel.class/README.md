Description
--------------------

I represent a group of branches. I am used in two principal cases. 

1) We want to group the branches of a remote
2) We want to group the local branches

Examples
--------------------

	"For a remote"
	IceBranchGroupModel repository: anIceRepository remote: anIceRemote.
	
	"For local branches"
	IceBranchGroupModel localFromRepository: anIceRepository
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	branches:		<aBlockOrSymbol>	This block takes the repository as parameter and should return the branches of the group
	groupName:		<aString>			Name of the group. In case I represent a remote it will be the remote name, else it will probably be "Local"
	repository:		<anIceRepository>	The repository where to get the branches
