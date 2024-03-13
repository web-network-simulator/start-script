#Delete the currently running catsial
rm -r -f ./network/back-end
echo "情報 - 現在実行しているbackendを削除しました"
sleep 2s

#Create a directory for the network
mkdir ./network
echo "情報 - networkディレクトリを作成しました"

cd ./network

#Clone catsial from git
echo "情報 - network back-endリポジトリをクローンします"
git clone git@github.com:web-network-simulator/back-end.git
sleep 2s
echo "完了 - gitから必要なリポジトリをクローンしました"

# Build & startup process
cd /home/nw/network/back-end
screen -S nw-backend -X quit
screen -dmS nw-backend
sleep 1s
screen -S nw-backend -X stuff 'python3 server.py'$(echo -ne '\015')

echo "完了 - 起動処理が完了しました"
echo "情報 - screen -r nw-backendでscreenに入ることが可能です"
echo "情報 - また、screenはCtrl+A+Dで抜けることが可能です"
