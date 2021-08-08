TMPDIR=/tmp/.mondev
MONDEV_VERSION ?= 0.09
all:
	latex vakthesis.ins

clean:
	rm -f casus.sty speciality.* vakaref.cls vakthesis.cls *.log xampl-aref.tex xampl-bib.tex xampl-ch1.tex xampl-concl.tex xampl-intro.tex xampl-mybib.bib xampl-thesis.bib xampl-thesis.tex *~

vak-adopt:
	rm -rf $(TMPDIR)/unpack/vak/* vakthesis/vak/*
	mkdir -p $(TMPDIR)/unpack/vak
	wget -O $(TMPDIR)/vakthesis-$(MONDEV_VERSION).zip "https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/vakthesis-$(MONDEV_VERSION).zip"
	unzip -d $(TMPDIR)/unpack/vak $(TMPDIR)/vakthesis-$(MONDEV_VERSION).zip
	# unpack
	cd $(TMPDIR)/unpack/vak && latex vakthesis.ins
	# convert README
		head -n5 /tmp/.mondev/unpack/vak/README | iconv -f CP1251 -t UTF8 > vakthesis/vak/README.md; \
		cat .res/vakthesis_preamble >> vakthesis/vak/README.md; \
		tail -n +5 /tmp/.mondev/unpack/vak/README | iconv -f CP1251 -t UTF8 >> vakthesis/vak/README.md
	# convert files
	for i in `ls $(TMPDIR)/unpack/vak/ | grep -vE 'README|*.pdf|*.ins|*.dtx'`; do \
		dos2unix $(TMPDIR)/unpack/vak/$$i; \
		iconv -f CP1251 -t UTF8 $(TMPDIR)/unpack/vak/$$i > vakthesis/vak/$$i; \
	done
	# BUGS, NEWS etc
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/BUGS | iconv -f CP1251 -t UTF8 > vakthesis/BUGS.md
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/ | iconv -f CP1251 -t UTF8 | pandoc --from=html --to=plain > vakthesis/NEWS.md

	# generate documentation
	cd $(TMPDIR)/unpack/vak && pdflatex vakthesis.dtx
	mkdir -p vakthesis/vak/doc && cp $(TMPDIR)/unpack/vak/*.pdf vakthesis/vak/doc
	rm -rf $(TMPDIR)

mon2017-adopt:
	rm -rf $(TMPDIR)/unpack/mon2017/* vakthesis/mon2017/*
	mkdir -p $(TMPDIR)/unpack/mon2017
	wget -q -O $(TMPDIR)/mon2017dev-$(MONDEV_VERSION).zip "https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/mon2017dev/mon2017dev-$(MONDEV_VERSION).zip"
	unzip -d $(TMPDIR)/unpack/mon2017 $(TMPDIR)/mon2017dev-$(MONDEV_VERSION).zip
	# convert README
		head -n5 /tmp/.mondev/unpack/mon2017/README | iconv -f CP1251 -t UTF8 > vakthesis/mon2017/README.md; \
		cat .res/vakthesis_preamble >> vakthesis/mon2017/README.md; \
		tail -n +5 /tmp/.mondev/unpack/mon2017/README | iconv -f CP1251 -t UTF8 >> vakthesis/mon2017/README.md
	# generate documentation
	# MON2017:
	for i in `ls $(TMPDIR)/unpack/mon2017/ | grep -vE 'README|*.pdf'`; do \
		dos2unix $(TMPDIR)/unpack/mon2017/$$i; \
		iconv -f CP1251 -t UTF8 $(TMPDIR)/unpack/mon2017/$$i > vakthesis/mon2017/$$i; \
	done
	mkdir vakthesis/mon2017/doc && cp $(TMPDIR)/unpack/mon2017/*.pdf vakthesis/mon2017/doc

vaksupport-adopt:
	rm -rf vakthesis/support/*
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/appbib.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/appbib.tex
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/arefcoversig.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/arefcoversig.tex
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/areftwobib.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/areftwobib.tex
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/orgcaption.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/orgcaption.tex
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/tocupch.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/tocupch.tex
	wget -q -O- https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/thsgdiff.tex  | iconv -f CP1251 -t UTF8 > vakthesis/support/thsgdiff.tex
	wget -q  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/thsgdiff/thsgdiff.pdf -O vakthesis/support/thsgdiff.pdf
