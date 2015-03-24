Bkwrapper
========

On my work, we have several projects, each one running on top of different databases - postgres, mysql, mongodb... - and I always forget the backup commands for each one of them.

That's why I've written this gem: To wrap up the backup commands so then I only have to remember one backup syntax.

As part of my needs, it also uplods the generated backup file to a amazon s3 account.

Usage
-----

```
bkwrapper [pg|mysql] [name-of-your-project] [name-of-your-database] [database-username] [database-password] [s3-access-key-id] [s3-secret-access-key] [s3-bucket-name]
```
