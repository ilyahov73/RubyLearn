while read line
do
eval $line
done < $1

echo $var1
echo $var2
echo $var3
