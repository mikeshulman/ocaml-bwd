type 'a bwd =
  | Emp
  | Snoc of 'a bwd * 'a

module Bwd :
sig
  (** This module is intended to mimic a small part of the {!module:Stdlib.ListLabels} module. We only add the functions we need. *)

  type 'a t = 'a bwd =
    | Emp
    | Snoc of 'a t * 'a

  val length : 'a t -> int
  val snoc : 'a t -> 'a -> 'a t
  val nth : 'a t -> int -> 'a
  val append : 'a t -> 'a list -> 'a t
  val prepend : 'a t -> 'a list -> 'a list

  module Notation :
  sig
    (** Notation inspired by Conor McBride. *)
    val (#<) : 'a t -> 'a -> 'a t
    val (<><) : 'a t -> 'a list -> 'a t
    val (<>>) : 'a t -> 'a list -> 'a list
  end

  (** {1 Comparison} *)

  val equal : eq:('a -> 'a -> bool) -> 'a t -> 'a t -> bool
  val compare : cmp:('a -> 'a -> int) -> 'a t -> 'a t -> int

  (** {1 Iterators} *)

  val iter : f:('a -> unit) -> 'a t -> unit
  val map : f:('a -> 'b) -> 'a t -> 'b t
  val mapi : f:(int -> 'a -> 'b) -> 'a t -> 'b t
  val filter_map : f:('a -> 'b option) -> 'a t -> 'b t
  val concat_map : f:('a -> 'b list) -> 'a t -> 'b t
  val fold_left : f:('a -> 'b -> 'a) -> init:'a -> 'b t -> 'a
  val fold_right : f:('a -> 'b -> 'b) -> 'a t -> init:'b -> 'b

  (** {1 Iterators on two lists} *)

  val fold_right2 : f:('a -> 'b -> 'c -> 'c) -> 'a t -> 'b t -> init:'c -> 'c

  (** {1 List scanning} *)

  val for_all : f:('a -> bool) -> 'a t -> bool
  val exists : f:('a -> bool) -> 'a t -> bool
  val mem : 'a -> set:'a t -> bool

  (** {1 List searching} *)

  val filter : f:('a -> bool) -> 'a t -> 'a t

  (** {1 Backward and forward lists} *)

  val to_list : 'a t -> 'a list
  val of_list : 'a list -> 'a t
end