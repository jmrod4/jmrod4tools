Create a Totally New Project
----------------------------

Create the project directory and some files

	$ mkdir yourproject
	$ cd yourproject
	$ touch README

NOTE: from this point on you are supposed to be **into the yourproject directory**

Create an empty repository

	$ git init

Add all your files and commit them!

	$ git add .
	$ git commit -m 'first commit'

Create a remote repository 

- go to github and just click (create) "New Repository"
- you will get a private access address

Connect your remote and local repositiories using your private access address

	$ git remote add origin git@github.com:youruser/yourproject.git

And finally pass your commits to the remote repo

	$ git push origin master

Fork an Existing Project
------------------------

Fork an existing project repo

- log into github.com as youruser
- go to the project you wish to fork
- press fork button 
- copy the private access address

Create (clone) a local repository

	# create and enter the repository directory

	$ mkdir hacketyhack
	$ cd hacketyhack
	
	# get the files using the private access address

	$ git clone git@github.com:youruser/hacketyhack.git

Link to the real 'original'

	# add another remote named 'upstream' with the original from the fork

	$ git remote add upstream git://github.com/hacketyhack/hacketyhack.git

Project Operation
-----------------

UPDATING FROM 'upstream'

	$ git fetch upstream
	$ git merge upstream/master

CHANGING LOCAL

	# do some wonderful changes first... and ready to commit

	# stage changes (to index)
	# (can undo with $ git reset HEAD ...)
	$ git add .

	# commiting changes (to local repo)
	$ git commit -m "My changes description"

	# or optionally to fully type the message in an editor
	$ git commit

CHANGING REMOTE

	$ git push origin master

SEEING GIT STATUS

	$ git status
	$ git status -s
	$ tig

