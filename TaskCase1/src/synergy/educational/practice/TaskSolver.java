package synergy.educational.practice;

import java.util.Random;

public class TaskSolver {
	public static int[] generateIntegerArray(int size, int minValue, int maxValue) {
		int[] array = new int[size];
		Random rnd = new Random();

		for (int i = 0; i < size; i++) {
			array[i] = rnd.nextInt(minValue, maxValue + 1);
		}

		return array;
	}

	public static TaskResult getNegativeValuesSumBetweenMinMaxValue(int[] array) {
		int minValueIndex = getArrayMinValueIndex(array);
		int maxValueIndex = getArrayMaxValueIndex(array);

		int resSum = 0;
		StringBuilder negativeValues = new StringBuilder();
		String negativeValuesResult;

		if (minValueIndex < maxValueIndex) {
			if(maxValueIndex - minValueIndex > 1) {
				for (int i = minValueIndex + 1; i < maxValueIndex; i++) {
					int el = array[i];

					if (el < 0) {
						resSum += el;
						negativeValues.append(el).append(",");
					}
				}
			}
		} else {
			if (minValueIndex - maxValueIndex > 1) {
				for (int i = maxValueIndex + 1; i < minValueIndex; i++) {
					int el = array[i];

					if (el < 0) {
						resSum += el;
						negativeValues.append(el).append(",");
					}
				}
			}
		}

		negativeValuesResult = negativeValues.toString();

		if (!negativeValuesResult.isEmpty()) {
			negativeValuesResult = negativeValuesResult.substring(0, negativeValuesResult.length() - 1);
		}

		return new TaskResult(resSum, negativeValuesResult);
	}

	public static int getArrayMinValueIndex(int[] array) {
		int minValue = Integer.MAX_VALUE;
		int minValueIndex = 0;

		for (int i = 0; i < array.length; i++) {
			if (array[i] < minValue) {
				minValue = array[i];
				minValueIndex = i;
			}
		}

		return minValueIndex;
	}

	public static int getArrayMaxValueIndex(int[] array) {
		int maxValue = Integer.MIN_VALUE;
		int maxValueIndex = 0;

		for (int i = 0; i < array.length; i++) {
			if (array[i] > maxValue) {
				maxValue = array[i];
				maxValueIndex = i;
			}
		}

		return maxValueIndex;
	}
}
