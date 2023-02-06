instance_ip=$(terraform output --raw instance_public_ip)
cd ../
scp -o StrictHostKeyChecking=no -i ./keys/ssh_key_aws -r src/ tests/ ./requirements.txt ./docker-compose.yml ./Dockerfile ec2-user@$instance_ip:~
cd ./terraform
ssh -i ../keys/ssh_key_aws ec2-user@$instance_ip
docker-compose up -d