# GIT tips

## GIT cheat sheet

GETTING INFO ABOUT REMOTES

	# show your configured remotes and the URL associated with them
	git remote -v

	# get more detailed info on a remote
	git remote show <remote>

	# other maybe useful commands for managing remotes
	git remote rename <remote_oldname> <remote_newname>
	git remote rm <remote>
	
UPDATING FROM REMOTES (INTERNET)

	# get everything new from remote 
	# (doesn't merge or modify your local changes)
	git fetch <remote>
	
	# fetches data from the server you originally cloned from and automatically
	# tries to merge it into the code you’re currently working on
	git pull
	
	# for and unmodified github clone/fork usually would be
	#   git merge origin/master
	git merge <remote>/<branch>

CHANGING LOCAL

	# do some wonderful changes first... and ready to commit

	# remove undesired files
	git rm <filename>
	# rename or move files (staging the changes)
	git mv <source> <destination>

	# remove the file from the staged area (but not from the disk)
	git rm --cached <filename>
		
	# stage changes
	# (can undo staging with $ git reset HEAD <filename>)
	git add .
	
	# discard the disk_file and restore it from last commit: 
	# YOU WILL LOSE YOUR CHANGES
	git checkout -- <filename>

	# commiting (saving) your changes invocating an editor to type a message
	git commit
	# optionally supply the message in the command line
	git commit -m "My changes description"
	# if you messed up the message... there is still some hope
	git commit --amend

CHANGING REMOTES (INTERNET)

When you have your project at a point that you want to share, you have to push it upstream. 

	# show your configured remotes and the URL associated with them
	git remote -v
	
	# pushing to our internet repository:
	# (normally with github remote=origin, branch=master)
	# ex. git push origin master
	git push <remote> <branch>

SEEING GIT STATUS

	# where was I? :)
	git status
	
	# just the files 
	git status -s
	
	# show diffs on local: last_commit vs. disk_file
	# show diffs on local: disk_file vs. cache_staged
	# it happens when you stage a file and edit/modify before committing
	git diff
	
	# show diffs on local: cache_staged vs. cache_lastcommit
	# same as git diff --cached
	git diff --staged
	
	# see last commits / extract history
	git log
	
	# ... or use a GUI to visualize history (HIGHLY RECOMMENDED)
	gitk

USING TAGS

	# assign a (lightweight) tag 
	# ex. git tag v0.1
	git tag <tag>
	
	# assign a (annotated) tag
	# ex. git tag -a v1.4 -m 'my version 1.4'
	git tag -a <tag>
	
	# see used tags
	git tag
	
	# see one tag details 
	git show <tag>
	
	# transfering tags to remote
	# ex. git push origin v0.1
	git push <remote> <tag>
	
	# or alternatively, transfer all local tags to remote
	# ex. git push origin --tags
	git push <remote> --tags
	
USING BRANCHES

	# create a branch...
	git branch <newbranch>
	# ...and switch to it
	git checkout <newbranch>
	
	# or alternatively create and switch
	git checkout -b <branch>
	
	# branch from a tag
	git branch <newbranch> <tag>
	# ...and switch to it
	git checkout <newbranch>
	
	# or alternatively branch from tag and switch to it
	git checkout -b <newbranch> <tag>

## Basic GIT operation

### Create a Totally New Project

Create the project directory and some files

	mkdir yourproject
	cd yourproject
	# just to make sure there is some file to create/update...
	touch README

(from this point on you are supposed to be **into the yourproject directory**)

Create an empty repository

	git init

Add all your files and commit them!

	git add .
	git commit -m 'first commit'

Create a web repository 

- go to your user Dashboard on github and just click (create) "New Repository"
- you will get a private access address

Connect your web and local repositiories using your private access address

	git remote add origin git@github.com:youruser/yourproject.git

And finally pass your commits to the web repo

	git push origin master

### Fork an Existing Project

Fork an existing project repo:

- log into github.com as youruser
- go to the project you wish to fork
- press fork button 
- copy the private access address

Create (clone) a local repository

	# get the files using the private access address
	git clone git@github.com:youruser/hacketyhack.git

	# enter into the just created repository directory
	cd hacketyhack

Link to the real 'original'

	# add another remote named 'upstream' with the original from the fork
	git remote add upstream git://github.com/hacketyhack/hacketyhack.git

## GIT tips from others

### help.github.com

* [set up git](http://help.github.com/set-up-git-redirect)
* [create a repo](http://help.github.com/create-a-repo)
* [fork a repo](http://help.github.com/fork-a-repo)
* [other cheat sheets!!](http://help.github.com/git-cheat-sheets/)

### External Links

* [git home](http://git-scm.com/)
* blog [git ready](http://gitready.com/)

Aditionally you can get help on your system (problably in HTML) using:

	# ex. git help push
	git help <command>

### Books On Line

* "Pro Git" book by Scott Chacon at [progit.org](http://progit.org/)

