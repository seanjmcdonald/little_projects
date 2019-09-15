#!/bin/bash
m_file=$(echo "$1"| cut -d "." -f 1)
$name_of_file
        mkdir -p $m_file
        unzip ./$m_file -d $m_file >/dev/null 2>&1
	echo "Making Student Directories"
        for i in $m_file/*; do
		name=$(echo "${i%%"_attempt"*}")
		namee=$(echo "${name##*[_]}")
		#nameee=$(echo "$namee" | cut -d "_" -f2) 
		name_of_file=$(echo "${i##*[0-9]_}")	
		FILE="$namee"
                echo $FILE | cut -d " " -f 2 | cut -d "_" -f 2 |uniq >>student_file
        done
        cat student_file |uniq>sample
	echo "Moving Files into Directories"
	search=$(echo "$name" | cut -d"/" -f2 | cut -d"_" -f1)
        cat sample | while read z; do
                mkdir -p ./$m_file/$z
                find ./. -name "$search*$z*" -exec mv -t ./$m_file/$z {} + ;
        done
	cd ./$m_file
	for q in * ; do 
		cd ./"$q"/
		for m in * ; do
			name=$(echo "${m%%"_attempt"*}")
			namee=$(echo "${name##*[_]}")
			nameee=$(echo "$namee" | cut -d "_" -f2) 
			name_of_file=$(echo "${m##*[0-9]_}")	
			file_check=$(echo "$m" | grep "$namee")
			is_valid=$(file mime--type | grep "text/plain")
			if [ ! -n  "$is_valid" ] ; then	
				if [ -n "$file_check" ] ; then
					if [ ! "$m" == "$name_of_file" ] ; then
						mv "$m" "$name_of_file"
					fi
				fi
			fi
		done
		cd ../
	done
	cd ../
	bash ./zip_master.bash "$m_file"
        rm student_file
