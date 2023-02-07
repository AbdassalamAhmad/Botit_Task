# copy private ssh key from secrets into github runner.
mkdir ../keys
cd ../keys
echo "$EC2_PRIVATE_SSH_KEY" > ssh_key_aws
sudo chmod 400 ssh_key_aws

# copy files from repo to EC2 instance
cd ../terraform
instance_ip=$(terraform output --raw instance_public_ip)
cd ../
scp -o StrictHostKeyChecking=no -i ./keys/ssh_key_aws -r src/ tests/ ./requirements.txt ./docker-compose.yml ./Dockerfile ec2-user@$instance_ip:~

# ssh into EC2 and deploy Flask-App.
ssh -i ./keys/ssh_key_aws ec2-user@$instance_ip << EOF
    ls -l
    docker-compose up --build -d
    docker exec -it flask_container python3 tests/test_hello.py
EOF