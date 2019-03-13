let status = ref 0
let err () = status := 1

let check res should =
  if res = should
  then "OK"
  else (err (); "Failed")

let () =
  let rect1 = Sdlrect.make4 10 10 100  60 in
  let rect2 = Sdlrect.make4 20 20 200 120 in
  let rect3 = Sdlrect.make4 220 220 20 20 in
  let should1, r1 = true,  Sdlrect.has_intersection ~a:rect1 ~b:rect2 in
  let should2, r2 = false, Sdlrect.has_intersection ~a:rect1 ~b:rect3 in
  Printf.printf "test 1: %s\n%!" (check r1 should1);
  Printf.printf "test 2: %s\n%!" (check r2 should2);
  exit !status
