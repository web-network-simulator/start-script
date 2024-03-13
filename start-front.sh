#Delete the currently running catsial
rm -r -f ./network/front-end
echo "情報 - 現在実行しているfrontendを削除しました"
sleep 2s

#Create a directory for the network
mkdir ./network
echo "情報 - networkディレクトリを作成しました"

cd ./network

#Clone nw-front from git
echo "情報 - network frontendリポジトリをクローンします"
git clone git@github.com:web-network-simulator/front-end.git
sleep 2s
echo "完了 - gitから必要なリポジトリをクローンしました"

# Build & startup process
cd /home/nw/network/front-end
npm install
npm run build
screen -S nw-front -X quit
screen -dmS nw-front
sleep 1s
screen -S nw-backend -X stuff 'npm start'$(echo -ne '\015')

echo "完了 - 起動処理が完了しました"
echo "情報 - screen -r nw-frontでscreenに入ることが可能です"
echo "情報 - また、screenはCtrl+A+Dで抜けることが可能です"
