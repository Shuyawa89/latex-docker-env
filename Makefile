SOURCE=Dockerfile
IMAGE=latex:latest

#コマンドと同じファイル名があるときの衝突回避用
.PHONY: build shell hello clean

#build container image
build:
	docker image build -t $(IMAGE) -f $(SOURCE) .

#create new container and login to the shell
shell:
	docker container run -it --rm \
		-v ${PWD}/workdir:/workdir \
		-w /workdir \
		$(IMAGE) /bin/bash

#build workdir/main.tex
pdflatex:
	docker container run -it --rm \
		-v ${PWD}/workdir:/workdir \
		-w /workdir \
		$(IMAGE) /bin/bash -c "pdflatex main.tex"

#clean up stopped container
clean:
	docker container prune