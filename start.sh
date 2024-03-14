# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define header/footer
HEADER="\n${BLUE}############################################${NC}\n"
FOOTER="\n${BLUE}############################################${NC}\n"

# Run the start-front.sh scripts
echo -e "${HEADER}${GREEN}Info - フロントエンド サービスを起動します${NC}${HEADER}"
./start-front.sh

# Run the start-back.sh scripts
echo -e "${HEADER}${GREEN}Info - バックエンド サーバを起動します${NC}${HEADER}"
./start-back.sh