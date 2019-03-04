#!/bin/sh

tar -zxvf OpenSSL_1_0_2q.tar.gz

cd openssl-OpenSSL_1_0_2q/
./config no-zlib
make
echo \$? > ~/install-exit-status
cd ~

echo "#!/bin/sh
./openssl-OpenSSL_1_0_2q/apps/openssl speed rsa4096 > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > openssl
chmod +x openssl


