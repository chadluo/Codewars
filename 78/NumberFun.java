public class NumberFun {
  public static long findNextSquare(long sq) {
    long root = (long) Math.sqrt(sq);
    if (Math.pow(root, 2) != sq) return -1;
    return (long) Math.pow((root + 1), 2);
  }
  public static void main(String[] args) {
    System.out.println(findNextSquare(121));
    System.out.println(findNextSquare(625));
    System.out.println(findNextSquare(114));
  }
}
