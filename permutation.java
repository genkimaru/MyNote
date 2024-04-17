import java.util.ArrayList;
import java.util.List;

public class PermutationGenerator {
    public static void main(String[] args) {
        String str = "abc";
        generatePermutations(str);
    }

    public static void generatePermutations(String str) {
        List<String> permutations = new ArrayList<>();
        generatePermutationsHelper("", str, permutations);
        for (String permutation : permutations) {
            System.out.println(permutation);
        }
    }

    private static void generatePermutationsHelper(String prefix, String remaining, List<String> result) {
        if (remaining.isEmpty()) {
            result.add(prefix);
        } else {
            for (int i = 0; i < remaining.length(); i++) {
                generatePermutationsHelper(prefix + remaining.charAt(i), remaining.substring(0, i) + remaining.substring(i + 1), result);
            }
        }
    }
}
