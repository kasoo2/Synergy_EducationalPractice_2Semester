package synergy.educational.practice;


import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		final int MIN_VALUE = -50;
		final int MAX_VALUE = 50;

		boolean isCorrectArraySize = false;
		int arraySize = 0;

		while (!isCorrectArraySize) {
			Scanner sc = new Scanner(System.in);

			System.out.print("Введите размер массива целым числом: ");

			try {
				arraySize = sc.nextInt();

				if (arraySize <= 2) {
					System.out.println("Минимальный размер массива должен быть не меньше 3!");
				} else {
					isCorrectArraySize = true;
				}
			} catch (Exception e) {
				System.out.println("Неверный формат введённого значения!");
			}
		}

		int[] nums = TaskSolver.generateIntegerArray(arraySize, MIN_VALUE, MAX_VALUE);

		System.out.printf("Сгенерированный массив чисел c диапазоном [%d;%d]: ", MIN_VALUE, MAX_VALUE);

		for (int i = 0; i < arraySize; i++) {
			System.out.print(nums[i]);

			if (i < (arraySize - 1)) {
				System.out.print(", ");
			}
		}

		System.out.println();

		int minValueIndex = TaskSolver.getArrayMinValueIndex(nums);
		int minValue = nums[minValueIndex];

		int maxValueIndex = TaskSolver.getArrayMaxValueIndex(nums);
		int maxValue = nums[maxValueIndex];

		System.out.printf("Мин. значение массива: %d (индекс: %d)\n", minValue, minValueIndex);
		System.out.printf("Макс. значение массива: %d (индекс: %d)\n", maxValue, maxValueIndex);

		TaskResult result = TaskSolver.getNegativeValuesSumBetweenMinMaxValue(nums);

		int sumNegativeValues = result.getSumNegativeValuesBetweenMinMax();
		String negativeValues = result.getNegativeValuesBetweenMinMax();

		if (!negativeValues.isEmpty()) {
			System.out.printf("Отрицательные элементы между мин. и макс. значениями: %s\n", negativeValues);
			System.out.printf("Сумма отрицательных элементов между минимальным и максимальным: %d\n", sumNegativeValues);
		} else {
			System.out.println("Между мин. и макс. значениями массива нет отрицательных элементов!");
		}
	}
}
