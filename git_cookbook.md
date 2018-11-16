NB: For simplicity, most recipes assume that the remote is called `origin` and the branch is `master`. Adapt as needed.

## Fixing a commit on a stale branch
Problem: I accidentally committed before pulling in latest changes. For example, local master is on commit A, remote master is on commit B, I commit C locally on top of A, but it should be on top of B.

Solution: `git pull --rebase origin master` ([via SO](https://stackoverflow.com/a/18442755/424245))

## Syncing a Fork
Problem: I forked e.g. pharo-vcs/iceberg, and now I want to get the latest commits.

Solution: See [explanation in GitHub help](https://help.github.com/articles/syncing-a-fork/)

## Combining Commits
Problem: I was trying to fix a hairy bug, and in desperation, I made a few "hail mary" commits which didn't work out and I feel that they will be noise if pushed. Now that I have the fix, I'd like to combine them all into one commit and discard the rest.  

Solution: This is called "squashing" in git parlance. There are a few ways to do this, but here's a simple example. Let's say you want to work with the last 4 commits. `git rebase -i HEAD~4`. You will then have an interactive editor where you can pick which ones to pick/squash/remove ([more info](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html) 

## Restoring Clone to Last Commit
Problem: I was playing around on the command line and messed up my local clone. I want to wipe the changes clean to match the remote

Solution: `git reset --hard origin/master` ([via SO](https://stackoverflow.com/questions/1628088/reset-local-repository-branch-to-be-just-like-remote-repository-head))

## Changing the Author of the Last Commit
Problem: I merged an MCZ of which I was not the author, and would like to preserve proper authorship in git.

Solution: `git commit --amend --author="John Doe <john@doe.org>"` ([via Tower](https://www.git-tower.com/learn/git/faq/change-author-name-email))
