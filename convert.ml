(*
  Convert Simple to C

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

let main () =
  let filename = Sys.argv.(1) in
    let inchan = open_in filename in
      let prog = Simple_aux.getProgram inchan in
        close_in inchan;
        Printf.printf "%s\n" (Simple.toC prog)

let _ = main ()
