(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/basics.atxt
** Time of generation: Sat Apr  4 14:36:54 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2012 *)

(* ****** ****** *)

primplmnt
false_elim () = case+ 0 of _ =/=> ()

(* ****** ****** *)

primplmnt eqint_make () = EQINT ()
primplmnt eqint_make_gint (x) = EQINT ()
primplmnt eqint_make_guint (x) = EQINT ()

(* ****** ****** *)

primplmnt eqaddr_make () = EQADDR ()
primplmnt eqaddr_make_ptr (x) = EQADDR ()

(* ****** ****** *)

primplmnt eqbool_make () = EQBOOL ()
primplmnt eqbool_make_bool (x) = EQBOOL ()

(* ****** ****** *)

primplmnt prop_verify () = ()
primplmnt prop_verify_and_add () = ()

(* ****** ****** *)

primplmnt pridentity_v (x) = ()
primplmnt pridentity_vt (x) = ()

(* ****** ****** *)

implement
{a}(*tmp*)
lazy_force (lazyval) = !lazyval
implement
{a}(*tmp*)
lazy_vt_force (lazyval) = !lazyval

(* ****** ****** *)

primplmnt
unit_v_elim (pf) = let
  prval unit_v () = pf in (*nothing*)
end // end of [unit_v_elim]

(* ****** ****** *)
//
// HX:
// See prelude/basics_dyn.sats
//
implement
{a}(*tmp*)
opt_unsome_get (x) =
  let prval () = opt_unsome (x) in x end
//
(* ****** ****** *)

(*
//
// HX: [atspre_argv_at_at] in basics.cats
//
implement
argv_get_at
  (argv, i) = x where {
  val (pf, fpf | p) =
    argv_takeout_strarr (argv)
  val x = !p.[i]
  prval () = minus_addback (fpf, pf | argv)
} // end of [argv_get_at]
*)

(* ****** ****** *)

implement{}
assertexn_bool0 (b) = if not(b) then $raise AssertExn()
implement{}
assertexn_bool1 (b) = if not(b) then $raise AssertExn()

(* ****** ****** *)

implement{a} gidentity (x) = x
implement{a} gidentity_vt (x) = x

(* ****** ****** *)

implement
{a}(*tmp*)
gcopy_val (x) = (x)
implement
(a:t@ype)
gcopy_ref<a> (x) = (x)

(* ****** ****** *)
//
implement
gequal_val_val<int> (x, y) = (x = y)
implement
gequal_val_val<bool> (x, y) = (x = y)
implement
gequal_val_val<char> (x, y) = (x = y)
implement
gequal_val_val<double> (x, y) = (x = y)
implement
gequal_val_val<string> (x, y) = (x = y)
//
(* ****** ****** *)
//
implement
(a:t@ype)
gequal_ref_ref<a>
  (x, y) = gequal_val_val<a> (x, y)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
tostring_val(x) = let
//
val str =
  $effmask_wrt(tostrptr_val<a>(x))
in
  strptr2string(str)
end // end of [tostring_val]
//
implement
{a}(*tmp*)
tostring_ref(x) = let
//
val str =
  $effmask_wrt(tostrptr_ref<a>(x))
in
  strptr2string(str)
end // end of [tostring_ref]
//
(* ****** ****** *)

implement
(a:t@ype)
tostrptr_ref<a> (x) = tostrptr_val<a> (x)

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_val (out, x) = let
  val str = tostrptr_val<a> (x)
  val ((*void*)) = fprint_strptr (out, str)
  val ((*void*)) = strptr_free (str)
in
  // nothing
end // end of [fprint_val]

(* ****** ****** *)

implement
(a:t@ype)
fprint_ref<a> (out, x) = fprint_val<a> (out, x)

(* ****** ****** *)

(*
//
// HX-2014-02-25: commented out
//
implement{a}
print_val (x) = fprint_val<a> (stdout_ref, x)
implement{a}
prerr_val (x) = fprint_val<a> (stderr_ref, x)
implement{a}
print_ref (x) = fprint_ref<a> (stdout_ref, x)
implement{a}
prerr_ref (x) = fprint_ref<a> (stderr_ref, x)
*)

(* ****** ****** *)

(* end of [basics.dats] *)
