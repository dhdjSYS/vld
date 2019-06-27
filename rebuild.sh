#!/bin/bash

bit64=`php -n -r 'echo PHP_INT_SIZE == 8 ? "1" : "0";'`

if [[ ${bit64} != "1" ]]; then
	export CFLAGS="-m32"
fi

phpize && ./configure --with-php-config=/www/server/php/70/bin/php-config && make clean && make all && make install
