在Java中，参数传递是按值传递的，但这需要理解Java中的值的概念。

Java中的参数传递是按值传递的，这意味着当你将一个变量作为参数传递给一个方法时，实际上传递给方法的是该变量的值的副本，而不是变量本身。因此，对传递的参数进行修改不会影响原始变量。这与引用传递有所不同，引用传递是传递变量的引用（内存地址），允许在方法内部修改原始变量。

然而，对于对象引用来说，传递的是对象的引用的副本。因此，虽然在方法内部无法修改原始引用，但是可以通过传递的引用访问和修改对象的状态。这种情况下，表现出来的行为更类似于引用传递。但需要明确的是，Java中仍然是按值传递的，只是这个值是对象的引用。

例如：

```java
public class Main {
    public static void main(String[] args) {
        int x = 10;
        modifyValue(x);
        System.out.println("x after modifyValue: " + x); // 输出 10

        StringBuilder sb = new StringBuilder("Hello");
        modifyReference(sb);
        System.out.println("sb after modifyReference: " + sb); // 输出 Hello World
    }

    public static void modifyValue(int num) {
        num = 20;
    }

    public static void modifyReference(StringBuilder builder) {
        builder.append(" World");
    }
}
```

在这个例子中，`modifyValue` 方法无法修改原始变量 `x` 的值，因为传递给方法的是 `x` 的值的副本。而 `modifyReference` 方法可以修改 `StringBuilder` 对象的状态，因为传递的是对象引用的副本，通过这个引用可以访问和修改对象的状态。