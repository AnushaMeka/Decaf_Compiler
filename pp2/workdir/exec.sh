#for file in ../samples/*.frag ../samples/*.decaf; do
#       echo "===================================================================="
#       echo "$file is running and generates output to standard output screen \n\n"
#       ./driver -d < ../samples/"$file"
#       echo "===================================================================="
#done

./driver -d < $1
