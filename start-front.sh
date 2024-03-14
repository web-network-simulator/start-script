# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define variables
NETWORK_DIR="./network"
FRONTEND_DIR="${NETWORK_DIR}/front-end"
REPO_URL="git@github.com:web-network-simulator/front-end.git"
SCREEN_NAME="nw-front"

# Delete the currently running catsial
rm -r -f ${FRONTEND_DIR}
echo -e "${GREEN}Info - 現在実行しているフロントエンド サービスを削除します${NC}"

# Create a directory for the network
echo -e "${GREEN}Info - networkディレクトリを作成します${NC}"
mkdir -p ${NETWORK_DIR}

# Clone nw-front from git
echo -e "${GREEN}Info - network frontendリポジトリをクローンします${NC}"
git clone ${REPO_URL} ${FRONTEND_DIR}
echo -e "${BLUE}Complete - gitから必要なリポジトリをクローンしました${NC}"
cd ${FRONTEND_DIR}

# Build & Startup process
echo -e "${GREEN}Info - ビルドと起動処理を開始します${NC}"
npm install
npm run build
echo -e "${BLUE}Complete - ビルド処理が正常に実行されました${NC}"

# Terminate any existing screen session
screen -S ${SCREEN_NAME} -X quit

# Start a new detached screen session
screen -dmS ${SCREEN_NAME}

# Allow some time for the screen session to start
sleep 1s

# Send the npm start command to the screen session
screen -S ${SCREEN_NAME} -X stuff 'npm run start'$(echo -ne '\015')

echo -e "${BLUE}Complete - 起動処理が正常に実行されました${NC}"
echo -e "${GREEN}Info - screen -r ${SCREEN_NAME}でscreenに入ることが可能です${NC}"
echo -e "${GREEN}Info - また、screenはCtrl+A+Dで抜けることが可能です${NC}"