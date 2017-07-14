Description
--------------------

I am an abstract class to define a common API for my subclasses that will manage some actions for some branch view of Iceberg. My subclasses will encapsulate a branch or a remote.

I am use in the branch view of the main browser of Iceberg.

Public API and Key Messages
--------------------

- #children				It should return the children of my element. It will probably return the branches of a remote for the remotes and nothing for the branches.
- #nameToDisplay		String to show to the user.
- #status 				Status to show to the user about incomming/unpublished commits.