#dependencies for package 'http.c'
http.o: http.c deps/http/http.h deps/stream/stream.h deps/stream/file.h

#dependencies for package 'deps/http/http.c'
deps/http/http.o: deps/http/http.c deps/http/request.h deps/http/response.h deps/http/common.h

#dependencies for package 'deps/http/request.c'
deps/http/request.o: deps/http/request.c deps/stream/stream.h deps/http/common.h deps/net/net.h deps/http/url.h

#dependencies for package 'deps/stream/stream.c'
deps/stream/stream.o: deps/stream/stream.c

#dependencies for package 'deps/http/common.c'
deps/http/common.o: deps/http/common.c deps/stream/stream.h deps/stream/file.h

#dependencies for package 'deps/stream/file.c'
deps/stream/file.o: deps/stream/file.c deps/stream/stream.h

#dependencies for package 'deps/net/net.c'
deps/net/net.o: deps/net/net.c deps/stream/stream.h deps/net/tlssocket.h deps/net/socket.h

#dependencies for package 'deps/net/tlssocket.c'
LIBRESSL_INCLUDE_DIR ?= /usr/local/opt/libressl/include
LIBRESSL_LIB_DIR ?= /usr/local/opt/libressl/lib
CFLAGS += -I$(LIBRESSL_INCLUDE_DIR)
LDFLAGS += -L$(LIBRESSL_LIB_DIR) -ltls 
deps/net/tlssocket.o: deps/net/tlssocket.c deps/stream/stream.h

#dependencies for package 'deps/net/socket.c'
deps/net/socket.o: deps/net/socket.c deps/stream/stream.h deps/stream/file.h

#dependencies for package 'deps/http/url.c'
deps/http/url.o: deps/http/url.c

#dependencies for package 'deps/http/response.c'
deps/http/response.o: deps/http/response.c deps/stream/stream.h deps/http/url.h deps/http/request.h deps/closure/closure.h deps/http/common.h deps/net/net.h deps/http/buffered_io.h

#dependencies for package 'deps/closure/closure.c'
deps/closure/closure.o: deps/closure/closure.c

#dependencies for package 'deps/http/buffered_io.c'
deps/http/buffered_io.o: deps/http/buffered_io.c deps/stream/stream.h deps/closure/closure.h

http: http.o deps/http/http.o deps/http/request.o deps/stream/stream.o deps/http/common.o deps/stream/file.o deps/net/net.o deps/net/tlssocket.o deps/net/socket.o deps/http/url.o deps/http/response.o deps/closure/closure.o deps/http/buffered_io.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) http.o deps/http/http.o deps/http/request.o deps/stream/stream.o deps/http/common.o deps/stream/file.o deps/net/net.o deps/net/tlssocket.o deps/net/socket.o deps/http/url.o deps/http/response.o deps/closure/closure.o deps/http/buffered_io.o -o http

CLEAN_http:
	rm -rf http http.o deps/http/http.o deps/http/request.o deps/stream/stream.o deps/http/common.o deps/stream/file.o deps/net/net.o deps/net/tlssocket.o deps/net/socket.o deps/http/url.o deps/http/response.o deps/closure/closure.o deps/http/buffered_io.o
