package synergy.educational.practice;

public class TaskResult {
	private final int sumNegativeValuesBetweenMinMax;
	private final String negativeValuesBetweenMinMax;

	public TaskResult(int sumNegativeValuesBetweenMinMax, String negativeValuesBetweenMinMax) {
		this.sumNegativeValuesBetweenMinMax = sumNegativeValuesBetweenMinMax;
		this.negativeValuesBetweenMinMax = negativeValuesBetweenMinMax;
	}

	public int getSumNegativeValuesBetweenMinMax() {
		return sumNegativeValuesBetweenMinMax;
	}

	public String getNegativeValuesBetweenMinMax() {
		return negativeValuesBetweenMinMax;
	}
}
