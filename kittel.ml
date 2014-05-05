(*
  Main program for termination analysis

  @author Stephan Falke

  Copyright 2010-2014 Stephan Falke

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*)

let getOut op = match op with
  | None -> []
  | Some trs -> trs

(* timeout stuff *)

let set_timer tsecs =
  ignore (Unix.setitimer Unix.ITIMER_REAL { Unix.it_interval = 0.0; Unix.it_value = tsecs })

exception Timeout

let handle_sigalrm signo =
  raise Timeout

let timed_run f arg1 arg2 tsecs defaultval =
  let oldsig = Sys.signal Sys.sigalrm (Sys.Signal_handle handle_sigalrm) in
    try
      set_timer tsecs;
      let res = f arg1 arg2 in
        set_timer 0.0;
        Sys.set_signal Sys.sigalrm oldsig;
        res
    with
      | Timeout ->
        (
          Sys.set_signal Sys.sigalrm oldsig;
          defaultval
        )

(* command line stuff *)

let combine = ref Simple.Ctrls
let filename = ref ""
let timeout = ref 0.0
let maxchaining = ref max_int
let disableproof = ref false

let usage = "usage: " ^ Sys.argv.(0) ^ " [-combine <method>] [-timeout <float>] [-smt-solver <solver>] [-max-chaining <int>] [-disable-proof] <filename>"

let stringToCombine s printer =
  if s = "statements" then
    Simple.Stmts
  else if s = "controlpoints" then
    Simple.Ctrls
  else if s = "ifs-loops" then
    Simple.IfsLoops
  else if s = "loops" then
    Simple.Loops
  else
  (
    Printf.printf "%s\n" (Sys.argv.(0) ^ ": unknown combination method `" ^ s ^ "'.");
    printer ();
    exit 1
  )

let checkSmtSolver s printer =
  let supportedSmtSolvers = ["yices";"yices2";"z3";"cvc4";"mathsat5"] in
    if Utils.contains supportedSmtSolvers s then
      s
    else
    (
      Printf.printf "%s\n" (Sys.argv.(0) ^ ": unknown SMT solver `" ^ s ^ "'.");
      printer ();
      exit 1
    )

let rec speclist =
  [
    ("-combine", Arg.String (fun s -> combine := stringToCombine s print_usage), "      - Set the combination method for Simple programs (statements/controlpoints/ifs-loops/loops)");
    ("--combine", Arg.String (fun s -> combine := stringToCombine s print_usage), "");
    ("-timeout", Arg.Set_float timeout, "      - Set the timeout (seconds)");
    ("--timeout", Arg.Set_float timeout, "");
    ("-smt-solver", Arg.String (fun s -> Smt.setSolver (checkSmtSolver s print_usage)), "   - Set the SMT solver (yices/yices2/z3/cvc4/mathsat5)");
    ("--smt-solver", Arg.String (fun s -> Smt.setSolver (checkSmtSolver s print_usage)), "");
    ("-max-chaining", Arg.Set_int maxchaining, " - Set the maximum  number the chaining processor is applied");
    ("--max-chaining", Arg.Set_int maxchaining, "");
    ("-disable-proof", Arg.Set disableproof, "- Disable proof output");
    ("--disable-proof", Arg.Set disableproof, "");
    ("-help", Arg.Unit (fun () -> print_usage (); exit 1), "         - Display this list of options");
    ("--help", Arg.Unit (fun () -> print_usage (); exit 1), "");
    ("-version", Arg.Unit (fun () -> Printf.printf "KITTeL\nCopyright 2010-2014 Stephan Falke\nVersion %s\n" Git_sha1.git_sha1; exit 1), "      - Display the version of this program");
    ("--version", Arg.Unit (fun () -> Printf.printf "KITTeL\nCopyright 2010-2014 Stephan Falke\nVersion %s\n" Git_sha1.git_sha1; exit 1), "")
  ]
and print_usage () =
  Arg.usage speclist usage

(* main function *)

let main () =
  Arg.parse speclist (fun f -> filename := f) usage;
  if !filename = "" then
  (
    Printf.printf "%s\n" (Sys.argv.(0) ^ ": need a filename.");
    print_usage ();
    exit 1
  )
  else
    let tt = Parser.parseTrs !filename !combine in
      Smt.smt_time := 0.0;
      let start = Unix.gettimeofday () in
        match (if !timeout = 0.0 then (Meta.process tt !maxchaining) else (timed_run Meta.process tt !maxchaining !timeout None)) with
          | None ->
            (
              if not !disableproof then
                Printf.printf "Timeout!\n";
              exit 2
            )
          | Some (trss, proof) ->
            (
              let stop = Unix.gettimeofday () in
                if not !disableproof then
                  Printf.printf "%s" (proof ());
                let trs = getOut trss in
                  if trs = [] then
                  (
                    if not !disableproof then
                    (
                      Printf.printf "Termination successfully shown!\n\n";
                      Printf.printf "Time: %.3f sec (SMT: %.3f sec)\n" (stop -. start) (!Smt.smt_time)
                    );
                    exit 0
                  )
                  else
                  (
                    if not !disableproof then
                    (
                      Printf.printf "The following termination problem could not be handled:\n%s\n\n" (Trs.toString trs);
                      Printf.printf "Time: %.3f sec (SMT: %.3f sec)\n" (stop -. start) (!Smt.smt_time)
                    );
                    exit 1
                  )
            )

let _ = main ()
