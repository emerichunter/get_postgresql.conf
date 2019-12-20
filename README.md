# get_postgresql.conf
Bash scripts to get configuration from postgresql server and make a postgresql.conf backup


* Use recup_postgresql.conf.sh to get from one or more server (inline usage)
~~~~bash
./recup_postgresql.conf.sh -u <user> -h <cluster1> [-h <cluster2> ... ]
~~~~

*  Use filerecup_postgresql.conf.sh to get configuration from servers listed in a file : 
~~~~bash
./filerecup_postgresql.conf.sh  -u <user> -f <ips.txt>
~~~~

### Future usage 
Use with maintenance_schema (without the need to deploy locally) to collect aggregated statistics proactively and prevent issues from happening and maintain performances.
