echo "Publishing ${1} app located at ${2}" 

PUBLISH_DIR=~/.cache/dotnet-apps/${1}/

cd ${2}
dotnet build -c Release -o ${PUBLISH_DIR}
dotnet publish --self-contained false -c Release -o ${PUBLISH_DIR}/publish/
cd ${PUBLISH_DIR}
#compress with -z 
rm -f /data/publish/${1}.tar.gz
pwd

tar -czf ${1}.tar.gz ./publish
mv ${1}.tar.gz /data/publish
cd /data/publish
makepkg -sf