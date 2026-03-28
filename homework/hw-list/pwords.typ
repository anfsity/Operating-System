#import "@preview/codly:1.3.0": *

#show: codly-init.with()

#show raw.where(block: true): it => rect(
  fill: luma(240),
  width: 100%,
  inset: 8pt,
  radius: 4pt,
  it
)

1

```bash
 ./pthread
Main stack: 7ffeedea73e8, common: 55cc5f65c048 (162)
I am on the heap.
main: creating thread 0
main: creating thread 1
main: creating thread 2
Thread #1 stack: 7f6bda702e80 common: 55cc5f65c048 (163) tptr: 1
55cc7a191010:  am on the heap.
Thread #1 stack: 7f6bdaf03e80 common: 55cc5f65c048 (162) tptr: 0
55cc7a191010: I am on the heap.
main: creating thread 3
Thread #2 stack: 7f6bd9f01e80 common: 55cc5f65c048 (164) tptr: 2
55cc7a191010: am on the heap.
Thread #3 stack: 7f6bd9700e80 common: 55cc5f65c048 (165) tptr: 3
55cc7a191010: m on the heap.
```

2 

```bash
 ./pthread
Main stack: 7fff165e4538, common: 55abe142c048 (162)
I am on the heap.
main: creating thread 0
main: creating thread 1
Thread #0 stack: 7f58a74ebe80 common: 55abe142c048 (162) tptr: 0
55abe226a010: I am on the heap.
main: creating thread 2
Thread #1 stack: 7f58a6ceae80 common: 55abe142c048 (163) tptr: 1
55abe226a010:  am on the heap.
main: creating thread 3
Thread #2 stack: 7f58a64e9e80 common: 55abe142c048 (164) tptr: 2
55abe226a010: am on the heap.
Thread #3 stack: 7f58a5cbbe80 common: 55abe142c048 (165) tptr: 3
55abe226a010: m on the heap.
```

3 

```bash
 ./pthread
Main stack: 7ffe30e2c078, common: 55b66ec62048 (162)
I am on the heap.
main: creating thread 0
main: creating thread 1
main: creating thread 2
Thread #0 stack: 7f4acf5c4e80 common: 55b66ec62048 (162) tptr: 0
55b679fd1010: I am on the heap.
Thread #1 stack: 7f4acedc3e80 common: 55b66ec62048 (163) tptr: 1
55b679fd1010:  am on the heap.
Thread #2 stack: 7f4ace5c2e80 common: 55b66ec62048 (164) tptr: 2
55b679fd1010: am on the heap.
main: creating thread 3
Thread #3 stack: 7f4ac5bfee80 common: 55b66ec62048 (165) tptr: 3
55b679fd1010: m on the heap.
```
4

```bash
 ./pthread
Main stack: 7ffca5183dc8, common: 55f38ec30048 (162)
I am on the heap.
main: creating thread 0
main: creating thread 1
Thread #0 stack: 7f3112657e80 common: 55f38ec30048 (162) tptr: 0
55f3b641c010: I am on the heap.
Thread #1 stack: 7f3111e56e80 common: 55f38ec30048 (163) tptr: 1
55f3b641c010:  am on the heap.
main: creating thread 2
main: creating thread 3
Thread #2 stack: 7f3111655e80 common: 55f38ec30048 (164) tptr: 2
55f3b641c010: am on the heap.
Thread #3 stack: 7f3110e27e80 common: 55f38ec30048 (165) tptr: 3
55f3b641c010: m on the heap.
```