echo "IF ELSE STATEMENT"
if (( $1 == $2 ))
then
        echo "$1 is Equal to $2"
else
        echo "$1 is NOT Equal to $2"
fi
echo "NESTED IF ELSE STATEMENT"
if (( $1 >= 0 ))
then
                echo "$1 is Non Negative Integer"
                if (( $1 == 0 ))
                then
                        echo "$1 is Equal to Zero"
                else
                        echo "$1 is NOT Equal to Zero"
                fi
else
                echo "$1 is Negative Integer"
fi
echo "SWITCH CASE STATEMENT"
case $3 in
        1) echo "Case 1 invoked";;
        2) echo "Case 2 invoked";;
        3) echo "Case 3 invoked";;
Esac
