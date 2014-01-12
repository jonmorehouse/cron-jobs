Personal Cron-Jobs
==================

Installation
--------------

```
crontab crontab
```


Sync Script
-----------

* syncs directories to dropbox (uses directory name in dropbox root)
* change directories in config/config.sh (folders array)
* assumes that dropbox directory is $HOME/dropbox
* directory-based exclude. Will override defaults

```
touch config/directory_name-exclude
```




