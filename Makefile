# keep user information here
include $(HOME)/flumecli/secret.mk

TOKEN=token
LOGFILE=./logfile

log:
	@cd $(HOME)/flumecli && ./flumecli.py --query --tokenfile $(TOKEN) --logfile $(LOGFILE)

test:
	@cd $(HOME)/flumecli && ./flumecli.py --query --tokenfile $(TOKEN)

auth:
	@cd $(HOME)/flumecli && ./flumecli.py --auth \
		--clientid $(USERID) \
		--clientsecret $(SECRET) \
		--username $(USERNAME) \
		--password $(PASSWORD) \
		--tokenfile $(TOKEN)
