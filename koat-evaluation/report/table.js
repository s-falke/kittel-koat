(function () {

    var provers = [];
    for (var provername in results) {
        if (!results.hasOwnProperty(provername)) {
            continue;
        }
        if (provername.substr(0,4) == 'KoAT') {
            provers.push({ name: provername
                         , supports_nonlinear: true
                         , supports_recursion: true
                         , stdoutext: '.koat.' + provername + '.stdout.txt'
                         , stderrext: '.koat.' + provername + '.stderr.txt'
                         , inputext: '.koat.' + provername + '.input.txt'
                         });
        } else if (provername.substr(0,4) == 'PUBS') {
            provers.push({ name: provername
                         , supports_nonlinear: false
                         , supports_recursion: true
                         , stdoutext: '.ces.' + provername + '.stdout.txt'
                         , stderrext: '.ces.' + provername + '.stderr.txt'
                         , inputext: '.ces.' + provername + '.input.txt'
                         });
        } else if (provername.substr(0,5) == 'SAS10') {
            provers.push({ name: provername
                         , supports_nonlinear: false
                         , supports_recursion: true
                         , stdoutext: '.fst.' + provername + '.rank.stdout.txt'
                         , stderrext: '.fst.' + provername + '.rank.stderr.txt'
                         , aspicstdoutext: '.fst.' + provername + '.aspic.stdout.txt'
                         , aspicstderrext: '.fst.' + provername + '.aspic.stderr.txt'
                         , inputext: '.fst.' + provername + '.input.txt'
                         });
        } else if (provername.substr(0,7) == 'CoFloCo') {
            provers.push({ name: provername
                         , supports_nonlinear: true
                         , supports_recursion: true
                         , stdoutext: '.cofloco.ces.' + provername + '.stdout.txt'
                         , stderrext: '.cofloco.ces.' + provername + '.stderr.txt'
                         , inputext: '.cofloco.ces.' + provername + '.input.txt'
                         });
        } else if (provername.substr(0,6) == 'Loopus') {
            provers.push({ name: provername
                         , supports_nonlinear: true
                         , supports_recursion: false
                         , stdoutext: '.koat.Loopus.c.stdout.txt'
                         , stderrext: '.koat.Loopus.c.stderr.txt'
                         , inputext: '.koat.Loopus.c.input.txt' 
                         });
        }
    }


    function text(t) {
        return document.createTextNode(t);
    }

    function el(tag) {
        return document.createElement(tag);
    }

    // here we represent '* log n' by a 0.5 step in the degree. this works
    // because floating point is precise on 0.5 steps.
    var ohCache = {};

    function getOh(i) {
        if (!ohCache.hasOwnProperty(i)) {
            var n;
            if (i === -1) {
                n = text('no result');
            } else if (i === 0) {
                n = text('O(1)');
            } else if (i === 0.5) {
                n = text('O(log n)');
            } else if (i === 1) {
                n = text('O(n)');
            } else if (i === 1.5) {
                n = text('O(n log n)');
            } else if (i >= 1000) {
                n = text('EXP');
            } else {
                n = el('span');
                n.appendChild(text('O(n'));
                var sup = el('sup');
                sup.appendChild(text(i));
                n.appendChild(sup);
                n.appendChild(text(')'));
            }
            ohCache[i] = n;
        }
        return ohCache[i].cloneNode(true);
    }

    function tableHeader() {
        var tr = el('tr');
        var th = el('th');
        th.appendChild(text('Example'));
        tr.appendChild(th);
        for (var i in provers) {
            var prover = provers[i];
            th = el('th');
            th.appendChild(text(prover.name));
            tr.appendChild(th);
        }
        return tr;
    }

    function generateResultCell(res, prover, file) {
        var td = el('td');
        if (res.hasOwnProperty('degree')) {
            td.setAttribute('class', 'hasBound');
            var n = res.hasOwnProperty('parsedBound') ? res.parsedBound : res.originalBound;
            if (n.length > 30) {
                var s = el('span');
                s.setAttribute('title', n);
                s.appendChild(text(n.substr(0,20) + '...'));
                td.appendChild(s);
            } else {
                td.appendChild(text(n));
            }
        } else {
            td.setAttribute('class', 'noBound');
        }
        td.appendChild(el('br'));
        var s = el('span');
        s.setAttribute('class', 'lower_line');
        if (res.hasOwnProperty('time')) {
            s.appendChild(text(res.time + 'ms'));
        } else {
            s.appendChild(text('TIMEOUT'));
        }
        if (res.hasOwnProperty('degree')) {
            s.appendChild(text(', '));
            s.appendChild(getOh(res.degree));
        }
        if (res.hasOwnProperty('variableCount')) {
            s.appendChild(text(', #vars: ' + res.variableCount));
        }
        e = el('a');
        e.setAttribute('href', 'runs/' + prover.name + '/' + file + prover.inputext);
        e.appendChild(text('input'));
        s.appendChild(text(', '));
        s.appendChild(e);
        if (res.hasOwnProperty('aspic_stdout')) {
            var e = el('a');
            e.setAttribute('href', 'runs/' + prover.name + '/' + file + prover.aspicstdoutext);
            e.appendChild(text('aspic'));
            s.appendChild(text(', '));
            s.appendChild(e);
        }
        if (res.hasOwnProperty('aspic_stderr')) {
            var e = el('a');
            e.setAttribute('href', 'runs/' + prover.name + '/' + file + prover.aspicstderrext);
            e.appendChild(text('aspic (errors)'));
            s.appendChild(text(', '));
            s.appendChild(e);
        }
        if (res.hasOwnProperty('stdout')) {
            var e = el('a');
            e.setAttribute('href', 'runs/' + prover.name + '/' + file + prover.stdoutext);
            e.appendChild(text('output'));
            s.appendChild(text(', '));
            s.appendChild(e);
        }
        if (res.hasOwnProperty('errors')) {
            var e = el('a');
            e.setAttribute('href', 'runs/' + prover.name + '/' + file + prover.stderrext);
            e.appendChild(text('errors'));
            s.appendChild(text(', '));
            s.appendChild(e);
        }
        td.appendChild(s);
        return td;
    }

    function generateRow(example) {
        var tr = el('tr');
        var td = el('td');
        var a = el('a');
        var file = example.filename;
        a.setAttribute('href', file + '.koat.txt');
        a.appendChild(text(file));
        td.appendChild(a);
        td.appendChild(el('br'));
        var s = el('span');
        td.appendChild(s);
        s.setAttribute('class', 'lower_line');
        if (example.nonlinear) {
            s.appendChild(text('nonlinear '));
        }
        if (example.recursive) {
            s.appendChild(text('recursive '));
        }
        tr.appendChild(td);
        for (var i in provers) {
            var prover = provers[i];
            var provername = prover.name;
            var pr = results[provername];
            var filename = example.filename;
            if (!prover.supports_recursion && example.recursive) {
                td = el('td');
                td.setAttribute('class', 'incompatible');
                td.appendChild(text('Recursive example not handled by prover.'));
                tr.appendChild(td);
            } else if (!prover.supports_nonlinear && example.nonlinear) {
                td = el('td');
                td.setAttribute('class', 'incompatible');
                td.appendChild(text('Non-linear example not handled by prover.'));
                tr.appendChild(td);
            } else {
                tr.appendChild(generateResultCell(pr[filename], prover, filename));
            }
        }
        return tr;
    }

    function generateOverviewTable(res) {
        var degrees = {};
        var solvedtimes = {};
        var alltimes = {};
        var solvedExamples = {};
        var useddegrees = {};
        var maxdegree = 0;
        var numEx = res.length;

        for (var pi in provers) {
            degrees[provers[pi].name] = {};
            solvedtimes[provers[pi].name] = 0;
            alltimes[provers[pi].name] = 0;
            solvedExamples[provers[pi].name] = 0;
        }

        for (var name in results) {
            var p = results[name];
            for (var i in res) {
                var ex = res[i];
                if (!p.hasOwnProperty(ex.filename)) {
                    continue;
                }
                var proof = p[ex.filename];
                if (proof.hasOwnProperty('degree')) {
                    var deg = proof.degree;
                    maxdegree = Math.max(deg, maxdegree);
                    if (deg >= 1000) { deg = 1000 } //group all EXP degrees...
                    useddegrees[deg] = true;
                    var count = degrees[name].hasOwnProperty(deg) ? degrees[name][deg] : 0;
                    degrees[name][deg] = count + 1;
                    solvedtimes[name] += proof.time;
                    solvedExamples[name]++;
                }
                alltimes[name] += proof.time;
            }
        }

        var t = el('table');
        var tr = el('tr');
        tr.appendChild(el('th'));
        for (var i = 0; i <= maxdegree; i += 0.5) {
            if (!useddegrees.hasOwnProperty(i)) {
                continue;
            }
            var th = el('th');
            th.appendChild(getOh(i));
            tr.appendChild(th);
        }
        th = el('th');
        th.appendChild(text('Avg. time'));
        tr.appendChild(th);
        th = el('th');
        th.appendChild(text('Avg. time (incl. Timeout)'));
        tr.appendChild(th);
        t.appendChild(tr);
        for (var pi in provers) {
            var tr = el('tr');
            var prover = provers[pi];
            var th = el('th');
            var name = prover.name;
            th.appendChild(text(prover.name));
            tr.appendChild(th);
            for (var i = 0; i <= maxdegree; i += 0.5) {
                if (!useddegrees.hasOwnProperty(i)) {
                    continue;
                }
                var td = el('td');
                var count = degrees[name].hasOwnProperty(i) ? degrees[name][i] : 0;
                td.appendChild(text(count));
                tr.appendChild(td);
            }
            var avgTime = solvedExamples[name] > 0 ? Math.floor(solvedtimes[name] / solvedExamples[name]) + 'ms' : '-';
            td = el('td');
            td.appendChild(text(avgTime));
            tr.appendChild(td);
            var avgTimeAll = numEx > 0 ? Math.floor(alltimes[name] / numEx) + 'ms' : '-';
            td = el('td');
            td.appendChild(text(avgTimeAll));
            tr.appendChild(td);
            t.appendChild(tr);
        }


        for (var i in provers) {
            var result = res[i];
        }

        var tableBox = document.getElementById('overview_table');
        while (tableBox.childNodes.length > 0) {
            tableBox.removeChild(tableBox.childNodes[0]);
        }
        tableBox.appendChild(t);

        var messageBox = document.getElementById('example_selection_message');
        while (messageBox.childNodes.length > 0) {
            messageBox.removeChild(messageBox.childNodes[0]);
        }
        messageBox.appendChild(text(numEx + ' examples selected.'));
    }

    function generateBenchmarkTable(res) {
        var t = el('table');
        t.appendChild(tableHeader());
        for (var i in res) {
            var result = res[i];
            t.appendChild(generateRow(result));
        }

        var div = document.getElementById('benchmark_table');
        while (div.childNodes.length > 0) {
            div.removeChild(div.childNodes[0]);
        }
        div.appendChild(t);
    }


    function getGroupValue(groupName) {
        var els = document.getElementsByName(groupName);
        for (var i = 0, l = els.length; i < l; ++i) {
            if (els[i].checked) {
                return els[i].value;
            }
        }
        return null;
    }

    function getSelectValue(id) {
        var el = document.getElementById(id);
        if (el === null) {
            return null;
        }
        return el.value;
    }

    function compare(f, asc) {
        if (asc) {
            return function (a, b) {
                var fa = f(a);
                var fb = f(b);
                if (fa === fb) {
                    return 0;
                }
                if (fa > fb) {
                    return 1;
                }
                return -1;
            }
        } else {
            return function (b, a) {
                var fa = f(a);
                var fb = f(b);
                if (fa === fb) {
                    return 0;
                }
                if (fa > fb) {
                    return 1;
                }
                return -1;
            }
        }
    }

    function getCheckBox(id) {
        var el = document.getElementById(id);
        return el.checked;
    }

    function updateControls () {
        var controls = document.getElementById('controls');
        var sortBy = getGroupValue('sortBy');
        var res = [];
        var sortFun = null;
        var asc = getGroupValue('sortAsc') === 'true';

        var recursive = getCheckBox('recursive');
        var nonrecursive = getCheckBox('nonrecursive');
        var linear = getCheckBox('linear');
        var nonlinear = getCheckBox('nonlinear');

        var solves = {};
        for (var i in provers) {
            var provername = provers[i].name;
            solves[provername] = getSelectValue(provername + 'Solves');
        }

        // filter results
        file: for (var i in window.files) {
            var example = window.files[i];
            var filename = example.filename;

            if ( (example.recursive && !recursive)
              || (!example.recursive && !nonrecursive)
              || (example.nonlinear && !nonlinear)
              || (!example.nonlinear && !linear)
            ) {
                continue;
            }

            for (var i in provers) {
                var provername = provers[i].name;
                if (!results[provername].hasOwnProperty(filename)) {
                    //Skip the whole example if this has to be solved by this prover:
                    if (solves[provername] === "yes") {
                        continue file;
                    } else {
                       continue;
                    }
                }
                var solved = results[provername][filename].hasOwnProperty('degree');
                if ((solves[provername] === 'yes' && !solved) || (solves[provername] === 'no' && solved)) {
                    continue file;
                }

                //New: Best solving: There is no prover with a more precise result:
                if (solves[provername] === "best" || solves[provername] === "notbest") {
                    proverDegree = Number.MAX_VALUE;
                    if (results[provername][filename].hasOwnProperty('degree')) {
                        proverDegree = results[provername][filename].degree;
                    }

                    var bestOtherDegree = Number.MAX_VALUE;
                    for (var j in provers) {
                        if (i == j) {
                            continue;
                        }
                        var otherprover = provers[j].name;
                        if (results[otherprover].hasOwnProperty(filename) && results[otherprover][filename].hasOwnProperty('degree')) {
                            bestOtherDegree = Math.min(bestOtherDegree, results[otherprover][filename].degree);
                        }
                    }

                    if (solves[provername] === "best" && !(proverDegree <= bestOtherDegree)) { //filter out cases where our result is not at least as good
                        continue file;
                    } else if (solves[provername] === "notbest" && (proverDegree <= bestOtherDegree)) { //filter out cases where we have the best result
                        continue file;
                    }
                }
            }


            if (   ((example.recursive && recursive) || (!example.recursive && nonrecursive))
                && ((example.nonlinear && nonlinear) || (!example.nonlinear && linear))) {
                res.push(example);
            }
        }

        var sortByProverSelector = document.getElementById('sortByProverSelector');

        if (sortBy !== 'filename') {
            sortByProverSelector.style.display = 'block';
            var sortByProver = getGroupValue('sortByProver');
            var valueIfMissing = 1000000;
            sortFun = compare(function(res) {
                filename = res.filename;
                if (!results[sortByProver].hasOwnProperty(filename)) {
                    return valueIfMissing;
                }
                var toolres = results[sortByProver][filename];
                return toolres.hasOwnProperty(sortBy) ? toolres[sortBy] : valueIfMissing;
            }, asc);
        } else {
            sortByProverSelector.style.display = 'none';
            sortFun = compare(function(res) { return res.filename }, asc);
        }

        res.sort(sortFun);

        generateOverviewTable(res);
        generateBenchmarkTable(res);
    }

    function createOption(value, description) {
        var op = document.createElement('option');
        op.setAttribute('value', value);
        op.appendChild(document.createTextNode(description));
        return op;
    }
    function createProverTable() {
        var t = document.createElement('table');
        for (var provername in results) {
            if (!results.hasOwnProperty(provername)) {
                continue;
            }
            var tr = document.createElement('tr');
            var td = document.createElement('td');
            td.appendChild(document.createTextNode(provername));
            tr.appendChild(td);
            td = document.createElement('td');
            var select = document.createElement('select');
            select.setAttribute('id', provername + 'Solves');
            select.setAttribute('name', provername + 'Solves');
            select.appendChild(createOption('maybe', 'may or may not solve'));
            select.appendChild(createOption('best', 'proves the tightest bound for'));
            select.appendChild(createOption('notbest', 'does not prove the tightest bound for'));
            select.appendChild(createOption('yes', 'solves'));
            select.appendChild(createOption('no', "doesn't solve"));
            td.appendChild(select);
            tr.appendChild(td);
            t.appendChild(tr);
        }
        document.getElementById('prover_table').appendChild(t);
    }

    function createSortByProver() {
        var f = document.getElementById('sortByProverSelector');

        var isFirst = true;
        for (var proverName in results) {
            var i = document.createElement('input');
            i.setAttribute('id', 'sortBy' + proverName);
            i.setAttribute('type', 'radio');
            i.setAttribute('name', 'sortByProver');
            i.setAttribute('value', proverName);
            if (isFirst) {
                i.setAttribute('checked', 'checked');
                isFirst = false;
            }

            var l = document.createElement('label');
            l.setAttribute('for', 'sortBy' + proverName);
            l.appendChild(document.createTextNode(proverName));

            f.appendChild(i);
            f.appendChild(l);
        }
    }

    function updateProverComparisonControls ()
    {
        var proverA = getGroupValue('proverA');
        var proverB = getGroupValue('proverB');

        var useddegrees = {};
        var comp_tab = {};

        var maxdegree = 0;

        var recursive = getCheckBox('recursive');
        var nonrecursive = getCheckBox('nonrecursive');
        var linear = getCheckBox('linear');
        var nonlinear = getCheckBox('nonlinear');

        var solves = {};
        for (var i in provers) {
            var provername = provers[i].name;
            solves[provername] = getSelectValue(provername + 'Solves');
        }

        function addResult (a, b, i) {
            maxdegree = Math.max(maxdegree, a);
            maxdegree = Math.max(maxdegree, b);
            useddegrees[a] = true;
            useddegrees[b] = true;
            if (!comp_tab.hasOwnProperty(a)) {
                comp_tab[a] = {};
            }
            if (!comp_tab[a].hasOwnProperty(b)) {
                comp_tab[a][b] = 0;
            }
            comp_tab[a][b] += i;
            return comp_tab[a][b];
        }

        for (var f in files) {
            var filename = files[f].filename;
            var example = window.files[f];
            if ( (example.recursive && !recursive)
              || (!example.recursive && !nonrecursive)
              || (example.nonlinear && !nonlinear)
              || (!example.nonlinear && !linear)
            ) {
                continue;
            }

            var a = -1;
            var b = -1;
            if (results[proverA].hasOwnProperty(filename) && results[proverA][filename].hasOwnProperty('degree')) {
                a = results[proverA][filename].degree;
            }
            if (results[proverB].hasOwnProperty(filename) && results[proverB][filename].hasOwnProperty('degree')) {
                b = results[proverB][filename].degree;
            }
            addResult(a, b, 1);
        }

        var degrees = [];
        for (var i = 0; i <= maxdegree; i += 0.5) {
            if (!useddegrees.hasOwnProperty(i)) {
                continue;
            }
            degrees.push(i);
        }
        //add unknown
        if (useddegrees.hasOwnProperty(-1)) {
            degrees.push(-1);
        }


        // preparation done, now generate html
        var table = document.createElement('table');

        var tr, th, td;

        tr = el('tr');
        th = el('th');
        th.appendChild(text(proverA));
        th.setAttribute('colspan', degrees.length + 2);
        th.setAttribute('class', 'table-prover-head');
        tr.appendChild(th);
        table.appendChild(th);

        tr = document.createElement('tr');
        th = el('th');
        th.appendChild(text(proverB));
        th.setAttribute('rowspan', degrees.length + 1);
        th.setAttribute('class', 'table-prover-head');
        tr.appendChild(th);


        tr.appendChild(document.createElement('td'));
        for (var i in degrees) {
            var degree = degrees[i];
            th = el('th');
            th.appendChild(getOh(degree));
            tr.appendChild(th);
        }
        table.appendChild(tr);
        for (var bi in degrees) {
            var bdegree = degrees[bi];
            tr = el('tr');
            th = el('th');
            th.appendChild(getOh(bdegree));
            tr.appendChild(th);
            for (var ai in degrees) {
                var adegree = degrees[ai];
                var num = addResult(adegree, bdegree, 0);
                td = el('td');
                if (num === 0) {
                    td.setAttribute('class', 'zero');
                }
                td.appendChild(text(num));
                tr.appendChild(td);
            }
            table.appendChild(tr);
        }

        var div = document.getElementById('comparison_table');
        while (div.childNodes.length !== 0) {
            div.removeChild(div.childNodes[div.childNodes.length - 1]);
        }
        div.appendChild(table);
    }

    function createProverComparisonTable() {
        var t = document.createElement('table');
        var tr = document.createElement('tr');
        tr.appendChild(document.createElement('td'));
        var th = document.createElement('th');
        th.appendChild(document.createTextNode('Prover A'));
        tr.appendChild(th);
        th = document.createElement('th');
        th.appendChild(document.createTextNode('Prover B'));
        tr.appendChild(th);
        t.appendChild(tr);
        var n = 0;
        for (var provername in results) {
            if (!results.hasOwnProperty(provername)) {
                continue;
            }
            var tr = document.createElement('tr');
            var td = document.createElement('td');
            td.appendChild(document.createTextNode(provername));
            tr.appendChild(td);

            td = document.createElement('td');
            var radio = document.createElement('input');
            radio.setAttribute('type', 'radio');
            radio.setAttribute('name', 'proverA');
            radio.setAttribute('value', provername);
            if (n == 0) {
                radio.setAttribute('checked', 'checked');
            }
            td.appendChild(radio);
            tr.appendChild(td);

            td = document.createElement('td');
            radio = document.createElement('input');
            radio.setAttribute('type', 'radio');
            radio.setAttribute('name', 'proverB');
            radio.setAttribute('value', provername);
            if (n == 1) {
                radio.setAttribute('checked', 'checked');
            }
            td.appendChild(radio);
            tr.appendChild(td);

            t.appendChild(tr);
            ++n;
        }
        document.getElementById('cmp_prover_table').appendChild(t);
    }

    function updateExampleSet() {
            updateControls();
            updateProverComparisonControls();
    }

    function setUp() {
        if (document.getElementById('benchmark_table') !== null) {
            createProverTable();
            var controls = document.getElementById('controls');
            controls.onchange = updateControls;
            updateControls();
        } 
        if (document.getElementById('comparison_table') !== null) {
            createProverComparisonTable();
            var controls = document.getElementById('cmp_controls');
            controls.onchange = updateProverComparisonControls;
            updateProverComparisonControls();
        }
        if (document.getElementById('sortByProverSelector') !== null) {
            createSortByProver();
        }
        document.getElementById('example_control_form').onchange = updateExampleSet;
    }

    window.onload = setUp;
}());
