Git is complicated. Git with images is even more complicated.
This page introduces the vocabulary used by Iceberg. Part of this vocabulary is Git vocabulary, part of it is Github's vocabulary, part of it is introduced by iceberg.

#### Disk Working Copy (Git)
It is important not to confuse the code in your disk with a the repository itself. The repository has a lot more information, such as known branches, history of commits, remote repositories, the git [index](#The-git-index) and much more. Normally this information is kept in a directory named `.git`. The contents of the repository (that you see on your disk) are just a *working copy* of the contents in the repository.

#### Iceberg Working Copy (Iceberg)

Iceberg also includes an object called the [working copy](The-Working-Copy(ies).md) that is not quite the same as Git's working copy.
Iceberg's working copy represents the code loaded in the image, with the loaded commit and the packages.

#### The git index
The index is an intermediate structure which is used to select the contents that are going to be committed. 

So, to commit changes to your local repository, two actions are needed: 
1. `git add someFileOrDirectory` will add `someFileOrDirectory` to the index. 
2. `git commit` will create a new commit out of the contents of the index, which will be added to your local repository and to the current branch.

> When using iceberg, you normally do not need to think about the index, Iceberg will handle it for you. Still, you might need to be aware that the index is part of the git repository, so if you have other tools working with the same repository there might be conflicts between them.

#### Commit-ish
A commit-ish is a reference that specifies a commit. Git command line tools usually accept several ways of specifying a commit, such as a branch or tag name, a SHA1 commit id, and several fatality-like combinations of symbols such as HEAD^, @{u} or master~2.

The following table contains examples for each commit-ish expression. A complete description of the ways to specify a commit (and other git objects) can be found [here](https://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html#_specifying_revisions). 

```
----------------------------------------------------------------------
|    Format                 |                Examples
----------------------------------------------------------------------
|  1. <sha1>                | dae86e1950b1277e545cee180551750029cfe735
|  2. <describeOutput>      | v1.7.4.2-679-g3bee7fb
|  3. <refname>             | master, heads/master, refs/heads/master
|  4. <refname>@{<date>}    | master@{yesterday}, HEAD@{5 minutes ago}
|  5. <refname>@{<n>}       | master@{1}
|  6. @{<n>}                | @{1}
|  7. @{-<n>}               | @{-1}
|  8. <refname>@{upstream}  | master@{upstream}, @{u}
|  9. <rev>^                | HEAD^, v1.5.1^0
| 10. <rev>~<n>             | master~3
| 11. <rev>^{<type>}        | v0.99.8^{commit}
| 12. <rev>^{}              | v0.99.8^{}
| 13. <rev>^{/<text>}       | HEAD^{/fix nasty bug}
| 14. :/<text>              | :/fix nasty bug
----------------------------------------------------------------------

```

#### Local Repository Missing (Iceberg)
The **Local Repository Missing** status is shown by iceberg when a project in the image does not found its repository in disk. This happens most probably because you've downloaded an image that somebody else created, or you deleted/moved a git repository in disk. Most of the times this status is not shown because iceberg automatically manages disk repositories.

To recover from this status, you need to update your repository by cloning a new git repository or by configuring an existing repository in disk.

#### Fetch required. Unknown ... (Iceberg)
The **Fetch required** status is shown by iceberg when a project in the image was loaded from a commit that cannot be found in its repository in disk. This happens most probably because you've downloaded an image that somebody else created, and/or your repository in disk is not up to date.

To recover from this status, you need to fetch from remotes to try to find the missing commit. It may happen that the missing commit is not in one of your configured remotes (even that nobody ever pushed it). In that case, the easiest solution is to discard your image changes and checkout an existing branch/commit.

#### Detached Working Copy (Iceberg)
The **Detached working Copy** status is shown by iceberg when a project in the image was loaded from a commit does not correspond with the current commit in disk. This happens most probably because you've modified your repository from the command line.

To recover from this status, you need to align your repository with your working copy. Either you can (1) discard your image changes and load the repository commit, (2) checkout a new branch pointing to your working copy commit or (3) merge what is in the image into the current branch.

- Detached HEAD (Git)
The **Detached HEAD** status means that the current repository in disk is not working on a branch but on a commit. From a git stand-point you can commit and continue working but your changes may get lost as the commit is not pointed by any branch. From an Iceberg stand-point, we forbid commit in this state to avoid strange situations.

To recover from this status, you need to checkout a (new or existing) branch.

#### Local and remote repositories (Git)
To work with git you always need a *local* repository (which is different from the code you see on your disk, that is not the repository, that is just your [working copy](#The-working-copy)). 

Most frequently your local repository will be related with one *remote repository* which is called *origin* and will be the default target for *pull* and *push*.

#### Upstream (Git)
The upstream of a branch is a remote branch which is the default source when you *pull* and the default target when you *push*. Most probably is a branch with the same name in your *origin* remote repository.