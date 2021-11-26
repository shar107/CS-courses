echo "Enter the number: "
read n
echo "Multiplication Table of $n is:"
for ((i=1;i<11;i++))
do
        a=`expr $n \* $i`
        echo "$n x $i = $a"
done
