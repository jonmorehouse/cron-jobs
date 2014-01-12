Personal Cron-Jobs
==================

High Level
----------

* Highlevel cron jobs for system tasks as needed
* Easy install script

Install Script
--------------

* start a cronjob to run each script once per day
* ready cron configuration from config/config -- so user can change easily
* remove existing cronjob with this name

Sync Script
-----------

* syncs directories to dropbox (uses directory name in dropbox root)
* change directories in config/config.sh (folders array)
* assumes that dropbox directory is $HOME/dropbox
* directory-based exclude `touch config/directory_name-exclude`. Will override defaults




