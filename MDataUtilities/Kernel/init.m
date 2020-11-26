
(* Mathematica Init File based on https://github.com/jkuczm/MathematicaSyntaxAnnotation *)
(*If package is loaded through init.m it'll be loaded as package with ordinary 'top-level' context. *)

Internal`InheritedBlock[{BeginPackage}
, BeginPackage // Unprotect   
; BeginPackage @ "`MDataUtilities`" := BeginPackage @ "MDataUtilities`"
; BeginPackage // Protect
; Get @ "MDataUtilities`MDataUtilities`"
]
