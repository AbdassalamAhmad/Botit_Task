instance_ip=$(terraform output --raw instance_public_ip)
cd ../ # go back to root folder
# copy private ssh key from secrets into github runner.
mkdir ./keys
echo "$EC2_PRIVATE_SSH_KEY" > ./keys/ssh_key_aws
sudo chmod 400 ./keys/ssh_key_aws

# copy files from repo to EC2 instance
scp -o StrictHostKeyChecking=no -i ./keys/ssh_key_aws -r src/ tests/ ./requirements.txt ./docker-compose.yml ./Dockerfile ec2-user@$instance_ip:~
