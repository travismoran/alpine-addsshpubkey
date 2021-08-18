FROM alpine
RUN apk add --no-cache --upgrade grep
COPY addsshpubkey.sh addsshpubkey.sh
CMD ["/bin/sh", "addsshpubkey.sh"]
