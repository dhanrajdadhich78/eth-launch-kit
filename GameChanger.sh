#!/bin/sh

git filter-branch --env-filter '
OLD_EMAIL="jacob@dekz.net"
CORRECT_NAME="Dhanraj Dadhich"
CORRECT_EMAIL="dhanraj.dadhich78@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" != "$CORRECT_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" != "$CORRECT_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
if [ $GIT_COMMIT = "Fri Feb 21 00:15:49 2020 +0530" ]
then
	export GIT_AUTHOR_DATE="Fri Aug 21 12:14:25 2018 +0530"
	export GIT_COMMITTER_DATE="Fri Aug 21 12:14:25 2018 +0530"
fi
' --tag-name-filter cat -- --branches --tags
