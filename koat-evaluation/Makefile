TIMEOUT=60
EXAMPLE_FILES=$(shell find ./examples -type f -name '*.properties')

PROVERS=KoAT-2014-08-27 PUBS SAS10 CoFloCo

REPORT_FILES=report/examples.js $(patsubst %,report/results-%.js,$(PROVERS))

.SECONDEXPANSION:

### Generate the report files:
.PHONY: report
report: $(REPORT_FILES)
	@echo "Updated evaluation report"

### Extracting / collecting data in report files:
report/examples.js: $(EXAMPLE_FILES)
	./bin/generate_example_set_report.sh > $@

report/results-KoAT-%.js: $(patsubst ./examples/%.properties,./runs/KoAT-$$*/%.koat.KoAT-$$*.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
	./bin/generate_benchmark_report.sh "KoAT-$*" > $@

#This is somewhat muddled. The COSTA wrapper is just PUBS, with a better preprocessing.
report/results-PUBS.js: $(patsubst ./examples/%.properties,./runs/COSTA/%.ces.COSTA.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
	./bin/generate_benchmark_report.sh "COSTA" > results-COSTA.js
	sed -i -e "s/results\['COSTA'\]/results['PUBS']/" results-COSTA.js
	mv results-COSTA.js "$@"
#report/results-PUBS.js: $(patsubst ./examples/%.properties,./runs/PUBS/%.ces.PUBS.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
#	./bin/generate_benchmark_report.sh "PUBS" > $@
#report/esults-COSTA.js: $(patsubst ./examples/%.properties,./runs/COSTA/%.ces.COSTA.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
#	./bin/generate_benchmark_report.sh "COSTA" > $@

report/results-SAS10.js: $(patsubst ./examples/%.properties,./runs/SAS10/%.fst.SAS10.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
	./bin/generate_benchmark_report.sh "SAS10" > $@

report/results-CoFloCo.js: $(patsubst ./examples/%.properties,./runs/CoFloCo/%.cofloco.ces.CoFloCo.time,$(EXAMPLE_FILES)) bin/parsebound bin/generate_benchmark_report.sh bin/output_funs.sh
	./bin/generate_benchmark_report.sh "CoFloCo" > $@

### Actually running the provers:

runs/KoAT%.time:
	$(eval KOATVERSION := $(shell echo $@ | sed -e 's!runs/\([^/]*\)/.*!\1!'))
	$(eval EXAMPLE := $(patsubst runs/$(KOATVERSION)/%.koat.$(KOATVERSION).time,examples/%.koat,$@))
	@mkdir -p $(shell dirname "$@")
	bash -c "time ./bin/KoAT-wrapper.sh '$(TIMEOUT)' '$(KOATVERSION)' '$(EXAMPLE)' '$@'" 2>'$@'
%.ces.PUBS.time:
	$(eval T := $(shell mktemp ))
	$(eval EXAMPLE := $(patsubst runs/PUBS/%.ces.PUBS.time,examples/%.ces,$@))
	@mkdir -p $(shell dirname "$@")
	timeout ${TIMEOUT} bash -c "time ./bin/PUBS-wrapper.sh '$(EXAMPLE)' '$@'" 2> "${T}" || :
	@mv "${T}" $@
%.ces.COSTA.time:
	$(eval T := $(shell mktemp ))
	$(eval EXAMPLE := $(patsubst runs/COSTA/%.ces.COSTA.time,examples/%.ces,$@))
	@mkdir -p $(shell dirname "$@")
	timeout ${TIMEOUT} bash -c "time ./bin/COSTA-wrapper.sh '$(EXAMPLE)' '$@'" 2> "${T}" || :
	@mv "${T}" $@
%.fst.SAS10.time:
	$(eval T := $(shell mktemp ))
	$(eval EXAMPLE := $(patsubst runs/SAS10/%.fst.SAS10.time,examples/%.fst,$@))
	@mkdir -p $(shell dirname "$@")
	timeout ${TIMEOUT} bash -c "time ./bin/SAS10-wrapper.sh '$(EXAMPLE)' '$@'" 2> "${T}" || :
	@mv "${T}" $@
%.ces.CoFloCo.time:
	$(eval T := $(shell mktemp ))
	$(eval EXAMPLE := $(patsubst runs/CoFloCo/%.ces.CoFloCo.time,examples/%.ces,$@))
	@mkdir -p $(shell dirname "$@")
	timeout ${TIMEOUT} bash -c "time ./bin/CoFloCo-wrapper.sh '$(EXAMPLE)' '$@'" 2> "${T}" || :
	@mv "${T}" $@
### Our little helper:
bin/parsebound: parsebound/*
	cd parsebound && make
	cp parsebound/parsebound.native bin/parsebound

clean:
	rm $(REPORT_FILES)

cleanruns:
	rm -rf runs/*

#Mark all files as secondary (i.e., non-intermediate, so that they don't get deleted automatically)
.SECONDARY: 

