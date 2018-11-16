I am a local branch. My main difference with remote branches is that I may have a remote tracked branch. This remote tracked branch allows me to calculate my incoming and outgoing commits.

  branch incomingCommits.
  branch hasIncomingCommits.
  branch outgoingCommits.
  branch hasOutgoingCommits.

I can moreover calculate incoming and outgoing commits to/from a given remote.

  branch incomingCommitsFrom: aRemote.
  branch hasIncomingCommitsFrom: aRemote.
  branch outgoingCommitsTo: aRemote.
  branch hasOutgoingCommitsTo: aRemote.

Notice that none of these operations fetches the remote, thus the information may not be up to date. You may explicitly fetch before doing these questions.

A local branch can also pull from its tracked branch or pull from a given remote.

  branch pull.
  branch pullFrom: aRemote.