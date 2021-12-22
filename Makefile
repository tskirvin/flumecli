include secret.mk
TOKEN=token
LOGFILE=./logfile

log:
	@cd /home/tskirvin/flumecli && ./flumecli.py --query --tokenfile $(TOKEN) --logfile $(LOGFILE)

test:
	@cd /home/tskirvin/flumecli && ./flumecli.py --query --tokenfile $(TOKEN)

auth:
	@./flumecli.py --auth --verbose \
		--clientid $(USERID) \
		--clientsecret $(SECRET) \
		--username $(USERNAME) \
		--password $(PASSWORD) \
		--tokenfile $(TOKEN)
