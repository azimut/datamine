WIDTH  ?= 1024
HEIGHT ?= 768

IMGS   := $(addprefix media/,$(patsubst %.gp,%.png,$(wildcard *.gp)))
THUMBS := $(addprefix media/thumbs/,$(patsubst %.gp,%.jpg,$(wildcard *.gp)))
.PHONY: thumbs
thumbs: $(THUMBS)
$(IMGS):

media/%.png: export GNUTERM = pngcairo size $(WIDTH),$(HEIGHT)
media/%.png: %.gp
	@mkdir -p $(@D)
	gnuplot $< | convert png:- -negate $@

media/thumbs/%.jpg: media/%.png
	@mkdir -p $(@D)
	mogrify -path $(@D) -format jpg -resize 600x $<
