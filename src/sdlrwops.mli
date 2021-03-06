(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Read / Write operations *)

(** API Doc:
  {{:http://wiki.libsdl.org/CategoryIO}IO category} *)

type t

external from_mem : string -> t
  = "caml_SDL_RWFromMem"
(** {{:http://wiki.libsdl.org/SDL_RWFromMem}api doc} *)

external from_file : filename:string -> mode:string -> t
  = "caml_SDL_RWFromFile"
(** {{:http://wiki.libsdl.org/SDL_RWFromFile}api doc} *)

type input = [
  | `Filename of string   (** provide the input by its filename *)
  | `Buffer of string     (** provide the input data as a buffer *)
  ]

val from_input :
  [< `Buffer of string | `Filename of string ] -> t

val from_input_opt :
  [> `Buffer of string | `Filename of string ] -> t option

external alloc : unit -> t = "caml_SDL_AllocRW"
external free : t -> unit = "caml_SDL_FreeRW"

external close : t -> unit = "caml_SDL_CloseRW"
(** {{:http://wiki.libsdl.org/SDL_RWclose}api doc} *)

type uint8 = int

type uint16 = int
type uint32 = int
type uint64 = int

external readU8 : t -> uint16 = "caml_SDL_ReadU8"
(** {{:http://wiki.libsdl.org/SDL_ReadU8}api doc} *)

external writeU8 : t -> uint16 -> int = "caml_SDL_WriteU8"
(** {{:http://wiki.libsdl.org/SDL_WriteU8}api doc} *)

module BigEndian : sig
  external read16 : t -> uint16 = "caml_SDL_ReadBE16"
  (** {{:http://wiki.libsdl.org/SDL_ReadBE16}api doc} *)

  external read32 : t -> uint16 = "caml_SDL_ReadBE32"
  (** {{:http://wiki.libsdl.org/SDL_ReadBE32}api doc} *)

  external read64 : t -> uint16 = "caml_SDL_ReadBE64"
  (** {{:http://wiki.libsdl.org/SDL_ReadBE64}api doc} *)

  external write16 : t -> uint16 -> int = "caml_SDL_WriteBE16"
  (** {{:http://wiki.libsdl.org/SDL_WriteBE16}api doc} *)

  external write32 : t -> uint16 -> int = "caml_SDL_WriteBE32"
  (** {{:http://wiki.libsdl.org/SDL_WriteBE32}api doc} *)

  external write64 : t -> uint16 -> int = "caml_SDL_WriteBE64"
  (** {{:http://wiki.libsdl.org/SDL_WriteBE64}api doc} *)
end

module LittleEndian : sig
  external read16 : t -> uint16 = "caml_SDL_ReadLE16"
  (** {{:http://wiki.libsdl.org/SDL_ReadLE16}api doc} *)

  external read32 : t -> uint16 = "caml_SDL_ReadLE32"
  (** {{:http://wiki.libsdl.org/SDL_ReadLE32}api doc} *)

  external read64 : t -> uint16 = "caml_SDL_ReadLE64"
  (** {{:http://wiki.libsdl.org/SDL_ReadLE64}api doc} *)

  external write16 : t -> uint16 -> int = "caml_SDL_WriteLE16"
  (** {{:http://wiki.libsdl.org/SDL_WriteLE16}api doc} *)

  external write32 : t -> uint16 -> int = "caml_SDL_WriteLE32"
  (** {{:http://wiki.libsdl.org/SDL_WriteLE32}api doc} *)

  external write64 : t -> uint16 -> int = "caml_SDL_WriteLE64"
  (** {{:http://wiki.libsdl.org/SDL_WriteLE64}api doc} *)
end

