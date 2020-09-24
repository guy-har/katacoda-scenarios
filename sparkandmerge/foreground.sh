until [ -f ~/.ssh/katacoda_rsa ]
do
     sleep 1
done
ssh -p 443 -i ~/.ssh/katacoda_rsa 3.236.12.181