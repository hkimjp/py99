set dotenv-load

develop:
	poetry run code .

clean:
	rm  py99.zip
	rm ./doctest/*.py
	rm ./pytest/*.py
	rm ./ruff/*.py
	rm ./tmp/*.py

uberjar:
	lein uberjar

deploy: uberjar
	scp target/uberjar/py99.jar ${DEST}:py99/py99.jar && \
	ssh ${DEST} 'sudo systemctl restart py99' && \
	ssh ${DEST} 'systemctl status py99'
