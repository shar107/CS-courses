echo "Enter the number of elements to print:"
read n
a=0
b=1
echo "The Fibonacci series is: "
for ((i=0; i<n; i++))
do
        echo “$a”
        f=` expr $a + $b `
        a=$b
        b=$f
done
