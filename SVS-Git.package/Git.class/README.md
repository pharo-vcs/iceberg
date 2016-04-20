I represent an interface to a git repository. 

My main responsibilities are:
- Load/update both baselines and individual packages from the repository.
- Commit changes to the local repository and publish them to a remote repository.
- Browse other versions of the loaded packages.
- Handle branches

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages
- loadPackage
- createBranch

Sample usage:

   Git new origin: 'git@github.com:npasserini/pharo-git-test.git'.
   git loadPackage: 'Pharo-Git-Test'. 


    Instance Variables
	origin:		<Object>
	repository:		<Object>


    Implementation Points