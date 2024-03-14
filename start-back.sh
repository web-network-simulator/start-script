# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define variables
NETWORK_DIR="./network"
BACKEND_DIR="${NETWORK_DIR}/back-end"
REPO_URL="git@github.com:web-network-simulator/back-end.git"
SCREEN_NAME="nw-back"

# Delete the currently running catsial
rm -r -f ${BACKEND_DIR}
echo -e "${GREEN}Info - 現在実行しているバックエンド サーバーを削除しました${NC}"

# Create a directory for the network
echo -e "${GREEN}Info - networkディレクトリを作成します${NC}"
mkdir -p ${NETWORK_DIR}

# Clone nw-back from git
echo -e "${GREEN}Info - ${BACKEND_DIR}にリポジトリをクローンします${NC}"
git clone ${REPO_URL} ${BACKEND_DIR}
echo -e "${BLUE}Complete - gitから必要なリポジトリをクローンしました${NC}"
cd ${BACKEND_DIR}

# Terminate any existing screen session
screen -S ${SCREEN_NAME} -X quit

# Start a new detached screen session
screen -dmS ${SCREEN_NAME}

# Allow some time for the screen session to start
sleep 1s

# Send the npm start command to the screen session
screen -S ${SCREEN_NAME} -X stuff 'python3 server.py'$(echo -ne '\015')

echo -e "${BLUE}Complete - 起動処理が正常に実行されました${NC}"
echo -e "${GREEN}Info - screen -r ${SCREEN_NAME}でscreenに入ることが可能です${NC}"
echo -e "${GREEN}Info - また、screenはCtrl+A+Dで抜けることが可能です${NC}"