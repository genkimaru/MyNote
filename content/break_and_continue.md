In Java, the `break` and `continue` keywords are used within loops to control the flow of the loop, but they have different functionalities:

1. `break`: The `break` keyword is used to exit the loop completely and continue executing the code after the loop. When `break` is encountered in a loop, the loop is terminated and the program control moves to the statement immediately after the loop.

Example:
```java
for (int i = 0; i < 5; i++) {
    if (i == 3) {
        break;
    }
    System.out.println(i);
}
```
Output:
```
0
1
2
```

2. `continue`: The `continue` keyword is used to skip the current iteration of the loop and continue with the next iteration. When `continue` is encountered in a loop, the current iteration is terminated and the loop proceeds to the next iteration.

Example:
```java
for (int i = 0; i < 5; i++) {
    if (i == 2) {
        continue;
    }
    System.out.println(i);
}
```
Output:
```
0
1
3
4
```

In summary, `break` is used to completely exit a loop, while `continue` is used to skip the current iteration and continue with the next iteration of the loop.
