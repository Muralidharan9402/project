read -p "Enter the local repository directory:" directory
cd $directory #/etc/ansible/project
git add --all
read -p "Enter the URL to add project to remote repository:" remotePath
read -p "Enter the branchname to add project to remote repository:" branchname
git remote add $branchname $remotePath  #https://github.com/Muralidharan9402/test_unix_push.git
read -p "Enter the Commit message:" commitMessage
git commit -am $commitMessage #"Regular auto-commit "
git pull origin master
git rebase master

git push $remotePath $branchname #https://github.com/Muralidharan9402/test_unix_push.git master
git merge master
