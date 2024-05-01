echo ---------------------
echo Hello PIAMOL - Chapter 2
echo ---------------------
echo The current Date is :
echo $(date)
echo ---------------------
echo My name is:
echo $(hostname)
echo ---------------------
echo I''m running on:
echo $(uname -s -r -m)
echo ---------------------
echo My address is:
echo $(ifconfig eth0 | grep inet)
echo ---------------------