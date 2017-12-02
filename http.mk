# dependencies for ./http.c
./http.o: ./http.c ./deps/http/http.h ./deps/stream/stream.h ./deps/stream/file.h

# dependencies for ./deps/http/http.c
./deps/http/http.o: ./deps/http/http.c ./deps/http/common.h ./deps/http/request.h ./deps/http/response.h

# dependencies for ./deps/http/common.c
./deps/http/common.o: ./deps/http/common.c ./deps/stream/stream.h ./deps/stream/file.h ./deps/stream/stream.h

# dependencies for ./deps/stream/stream.c
./deps/stream/stream.o: ./deps/stream/stream.c

# dependencies for ./deps/stream/file.c
./deps/stream/file.o: ./deps/stream/file.c ./deps/stream/stream.h ./deps/stream/stream.h

# dependencies for ./deps/http/request.c
./deps/http/request.o: ./deps/http/request.c ./deps/net/net.h ./deps/stream/stream.h ./deps/http/url.h ./deps/http/common.h ./deps/http/common.h ./deps/http/url.h ./deps/stream/stream.h

# dependencies for ./deps/net/net.c
./deps/net/net.o: ./deps/net/net.c ./deps/stream/stream.h ./deps/net/socket.h ./deps/net/tlssocket.h ./deps/stream/stream.h

# dependencies for ./deps/net/socket.c
./deps/net/socket.o: ./deps/net/socket.c ./deps/stream/stream.h ./deps/stream/file.h ./deps/stream/stream.h

# dependencies for ./deps/net/tlssocket.c
LIBRESSL_INCLUDE_DIR ?= /usr/local/opt/libressl/include
LIBRESSL_LIB_DIR ?= /usr/local/opt/libressl/lib
CFLAGS += -I$(LIBRESSL_INCLUDE_DIR)
LDFLAGS += -L$(LIBRESSL_LIB_DIR) -ltls 
./deps/net/tlssocket.o: ./deps/net/tlssocket.c ./deps/stream/stream.h ./deps/stream/stream.h

# dependencies for ./deps/http/url.c
./deps/http/url.o: ./deps/http/url.c

# dependencies for ./deps/http/response.c
./deps/http/response.o: ./deps/http/response.c ./deps/closure/closure.h ./deps/stream/stream.h ./deps/net/net.h ./deps/http/url.h ./deps/http/buffered_io.h ./deps/http/common.h ./deps/http/request.h ./deps/stream/stream.h ./deps/http/request.h

# dependencies for ./deps/closure/closure.c
./deps/closure/closure.o: ./deps/closure/closure.c

# dependencies for ./deps/http/buffered_io.c
./deps/http/buffered_io.o: ./deps/http/buffered_io.c ./deps/closure/closure.h ./deps/stream/stream.h ./deps/stream/stream.h ./deps/closure/closure.h

http: ./deps/stream/stream.o ./deps/stream/file.o ./deps/http/common.o ./deps/net/socket.o ./deps/net/tlssocket.o ./deps/net/net.o ./deps/http/url.o ./deps/http/request.o ./deps/closure/closure.o ./deps/http/buffered_io.o ./deps/http/response.o ./deps/http/http.o ./http.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS)  ./deps/stream/stream.o ./deps/stream/file.o ./deps/http/common.o ./deps/net/socket.o ./deps/net/tlssocket.o ./deps/net/net.o ./deps/http/url.o ./deps/http/request.o ./deps/closure/closure.o ./deps/http/buffered_io.o ./deps/http/response.o ./deps/http/http.o ./http.o -o http

CLEAN_http:
	rm -rf http  ./deps/stream/stream.o ./deps/stream/file.o ./deps/http/common.o ./deps/net/socket.o ./deps/net/tlssocket.o ./deps/net/net.o ./deps/http/url.o ./deps/http/request.o ./deps/closure/closure.o ./deps/http/buffered_io.o ./deps/http/response.o ./deps/http/http.o ./http.o
