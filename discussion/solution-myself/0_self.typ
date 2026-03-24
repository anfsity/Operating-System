= 1.1 Concept Check

== 1.

32 bits

=== Bonus question

No, since sizeof is a compile time operator...

It will evaulated in compile-time.

== 2.

I think the answer is yes. while a is a pointer (variable) b is a const pointer.

And we cannot modify a's data, because a is point read-only data.

We should also notice that b allocate memory in stack...

== 3.

emmm... `p->x` means dereference p and access its x, and we should notice that p actually do not own any point.

This is not work, which will cause segfault. `p.x` means access x in p.

= 1.2 Headers

== 1.

128 bits. `char*` (64 bits) + char (8 bits), and we need to align memory.

so answer is 128 bits.

== 2.

192 bits.

== 3.

Because we defined a macro "ABC", so actually there is no string in helper_args.

In app.c we access helper_args.string and target, these are undefined behavior, may cause your computer broken :P

And in lib.c, we not have a macro ABC, which cause a unique helper_args in lib.c

When we linked app.o and lib.o, helper_args (app.o) is different from helper_args (lib.o), this is also a ub.

= 2.1 Concept Check

== 1.

BP

== 2.

xor %eax, %eax

movl \$0, %eax

subl %eax, %eax

== 3.

True? Idk...

= 2.2 Stack Frame

== 1.

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: horizon,

  [caller], [prologue], [epilogue],
  [], [line 24-27], [line 29],
  [callee], [prologue], [epilogue],
  [], [line 4-6], [line 13-15],
)

== 2. & 3.

I think these two questions are the same question. All are because edx is callee-saved register.

== 4.

I'm lazy :P, I have already doen this in bomb lab... it left a deep impression on me.