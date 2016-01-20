import java.io.*;
import java.util.*;
interface AdvancedArithmetic{
   int divisorSum(int n);
}

class Calculator implements AdvancedArithmetic {
	public int divisorSum(int n) {
		int sum = 1;
		for (int i = 2; i <= n; i += 1) {
			if (n % i == 0) {
				sum += i;
			}
		}
		return sum;
	}
}

public class Solution {

    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
      	AdvancedArithmetic myCalculator=new Calculator(); 
        int sum=myCalculator.divisorSum(n);
        System.out.println("I implemented: AdvancedArithmetic\n"+sum);
    }
}