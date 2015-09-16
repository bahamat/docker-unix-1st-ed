.PHONY: all build run
all: build

build: Unix-1st-Edition-jun72/images/rf0.dsk
	docker build -t bahamat/unix-1st-ed .

run: all
	docker run --rm -it bahamat/unix-1st-ed

simhv39-0.zip:
	curl --progress -LOC - http://simh.trailing-edge.com/sources/simhv39-0.zip

simhv/makefile: simhv39-0.zip
	[ -d simhv ] || mkdir simhv
	cd simhv; unzip ../$<
	touch $@

simhv/BIN/pdp11: simhv/makefile
	make -C simhv BIN/pdp11

Unix-1st-Edition-jun72/tools/pdp11: simhv/BIN/pdp11
	cp $< $@

Unix-1st-Edition-jun72:
	git clone https://github.com/bahamat/$@

Unix-1st-Edition-jun72/images/rf0.dsk: Unix-1st-Edition-jun72 Unix-1st-Edition-jun72/tools/pdp11
	make -C $<

distclean:
	$(RM) simhv39-0.zip

clean:
	$(RM) -r Unix-1st-Edition-jun72 simhv
