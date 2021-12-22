# keep user information here
include $(HOME)/flumecli/secret.mk

TOKEN=token
LOGFILE=./logfile

log:
	@cd $(HOME)/flumecli && ./flumecli.py --query --tokenfile $(TOKEN) --logfile $(LOGFILE)

test:
	@cd $(HOME)/flumecli && ./flumecli.py --query --tokenfile $(TOKEN)

auth:
	@./flumecli.py --auth --verbose \
		--clientid $(USERID) \
		--clientsecret $(SECRET) \
		--username $(USERNAME) \
		--password $(PASSWORD) \
		--tokenfile $(TOKEN)
