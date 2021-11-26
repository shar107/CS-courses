String="$1"
len=${#String}
for ((i = $len-1; i >= 0; i--))
do
                reverse="$reverse${String:$i:1}"
done
echo $reverse
