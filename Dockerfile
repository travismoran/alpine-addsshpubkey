FROM alpine
RUN apk add --no-cache --upgrade grep
COPY addsshpubkey.sh addsshpubkey.sh
CMD ["sh --login", "addsshpubkey.sh"]
