export AWS_PROFILE=dmarc-digests-staging
docker build . -f Dockerfile.main -t main
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 930237623491.dkr.ecr.us-east-2.amazonaws.com
docker tag main 930237623491.dkr.ecr.us-east-2.amazonaws.com/main
docker push 930237623491.dkr.ecr.us-east-2.amazonaws.com/main
docker build . -f Dockerfile.app -t app
docker tag app 930237623491.dkr.ecr.us-east-2.amazonaws.com/app
docker push 930237623491.dkr.ecr.us-east-2.amazonaws.com/app