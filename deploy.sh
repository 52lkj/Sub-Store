curl -sSL https://raw.githubusercontent.com/.../deploy.sh | bash
mkdir -p sub-store/data
curl -o sub-store/docker-compose.yml https://raw.githubusercontent.com/你的路径/docker-compose.yml
cd sub-store
docker compose up -d
echo "部署完成！"
