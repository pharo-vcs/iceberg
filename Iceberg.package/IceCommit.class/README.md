I represent a repository commit. As such, I hold information about commit message, date, author and id:

  aCommit id.
  aCommit author.
  aCommit datetime.
  aCommit comment.

I also provide operations to access my history:

  aCommit parent.
  aCommit ancestors.
  aCommit isAncestorOf: anotherCommit.
  aCommit isParentOf: anotherCommit.

And to the packages existing in that commit:

  aCommit packageNames.

IMPORTANT IMPLEMENTATION NOTE. For optimization purposes, a commit caches the names of the packages inside himself. This was made under the assumption that a commit is immutble and nobody "cooks" the commit once it is in the repository.