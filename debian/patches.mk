.NOTPARALLEL:

clean: unpatch
build: patch

patch: patch-stamp
patch-stamp:
	[ ! -d debian/patches ] || QUILT_PATCHES=debian/patches quilt push -a
	touch $@

unpatch:
	[ ! -f patch-stamp ] || QUILT_PATCHES=debian/patches quilt pop -a
	rm -f patch-stamp
