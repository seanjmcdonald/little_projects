#sean
#Thu Jun 29 01:04:06 PDT 2017
#make_files.bash
#i made this file as a way of making things quicker for students and people in general in regards to making the 
#tedious file making process is easier




######################################" normal @reg

#smaller a bad file is crashing it

for i in "$@" ; 
do 
	is_cpp=$(echo $i | grep ".cpp")
	if [ -n $is_cpp ] ; then
		
		header=$(echo ${is_cpp::-3}h)
		#next two lines to uppercase the class name for the h file
		classy=$(echo "${header^}")
		class=$(echo ${classy::-2})
		main="true"
		ALL_FILES+="$header "
		echo "/*******************************" >> $is_cpp
		vi +:w +r!users +r!date +"r!ls %" +:wq $is_cpp
		echo "********************************/" >> $is_cpp
		echo -e "#include \"$header\"\n$class::$class()\n\t{}">>$is_cpp


		echo "/*******************************" >> $header
		vi +:w +r!users +r!date +"r!ls %" +:wq $header
		echo -e "********************************/\n" >> $header
		echo "class $class{">>$header
		echo -e "\tprivate:\n\n\tprotected:\n\n\tpublic:\n\t\t$class();\n};" >>$header
	else 
		continue
	fi

done
if [ "$main" == "true" ] ; then
	temp=${ALL_FILES::-1}
	unset main
	main="main.cpp"
	echo "/*******************************" >> $main
	vi +:w +r!users +r!date +"r!ls %" +:wq $main
	echo "********************************/" >> $main
	echo -e "#include <iostream>\n#include <string>">>$main 
	#echo "#include <string>">>$main 
	for i in $temp ; 
	do 
		echo "$i"
		echo "#include \"$i\"">>$main 
	done
	echo -e "using namespace std;\n\nint main(){\n">>$main
	echo -e "return 0;\n}" >> $main
fi
