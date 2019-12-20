#!/usr/bin/env bash

E_NOARGS=65

usage() {
	#if [ "$#" -ne 2 ];
	#then
  echo ""  
  echo ""  
  echo "            Mauvais nombre d'arguments !"
  echo ""  
  echo "Usage: `basename $0` -u <user>  -f <ips.txt> "
  echo ""  
  echo ""  
  echo ""  
  echo ""  
  echo ""  
   #  exit $E_NOARGS
   #fi
}

#Gestion des variables d'entrée
while getopts "f:u:" option
do
	case $option in 
		f|file)
			f=${OPTARG}
			;;
		u|user)
			u=${OPTARG}
			;;
		*) 
			usage
			;;

	esac
done 

#Variables obligatoires
if [ -z "${u}" ] ||  [ -z "${f}" ]; then 
	usage
fi


while read ip 
do 
	echo "recupération postgresql.conf $ip"
	psql -U $u -h $ip -t -c "select name ||'='|| setting from pg_settings where boot_val != reset_val or boot_val != setting;" -o postgresql.conf.$ip
	echo "récupération $ip terminée"
done < "$f"
