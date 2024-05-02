docker build -t github-cicd --build-arg GITHUB_TOKEN=$(cat .env | grep GITHUB_TOKEN | cut -d '=' -f2) --build-arg GITHUB_REPO=$(cat .env | grep GITHUB_REPO | cut -d '=' -f2) .
docker run --network host -it github-cicd
