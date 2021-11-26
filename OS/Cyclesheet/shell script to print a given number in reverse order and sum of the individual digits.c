reverse

echo "Enter any integer: "
read number
n=$number
remainder=0
reverse=0
unit=10
while [ $n -gt 0 ]
do
                remainder=`expr $n % 10`
                reverse=`expr $reverse \* 10 + $remainder`
                n=`expr $n / 10`
done
echo "The reverse is: $reverse"




sum

echo "Enter a number for its sum (of individual digits) to print on the next line: "
read num

sum=0

while [ $num -gt 0 ]
do
    mod=`expr $num % 10`    #It will split each digits
    sum=`expr $sum + $mod`  #Add each digit to sum
    num=`expr $num / 10`    #divide num by 10.
done

echo $sum
