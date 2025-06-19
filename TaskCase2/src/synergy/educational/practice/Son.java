package synergy.educational.practice;

import java.util.ArrayList;

public class Son extends Father {

	public Son() {
		this("Vladimir", 12, 45, "Blue");
	}

	public Son(ArrayList<String> personality) {
		super(personality);
	}

	public Son(String name, int age, double weight, String eyeColor) {
		super(name, age, weight, eyeColor);

		skills.add("Play Games");
		skills.add("Programming");
		personality.add("Funny");
	}

	public Son(String name, int age, double weight, String eyeColor, ArrayList<String> skills, ArrayList<String> personality) {
		super(name, age, weight, eyeColor, skills, personality);
	}

	public void playGames() {
		System.out.println("Now i'm playing computer games!");
	}

	public void developProgram() {
		System.out.println("Hmm... I need to fix this bug and add new feature in my app!");
	}

	@Override
	public void goToFish() {
		System.out.println("I hate fishing!");
	}

	@Override
	public void talk() {
		System.out.println("I'm a son!");
		System.out.println("Daddy, i'm here!");
		System.out.println("I'm playing football");
	}

	@Override
	public void eat(String food) {
		if (food.equalsIgnoreCase("olives")) {
			System.out.println("I don't like olives!!!");
		} else {
			System.out.printf("I'm eating %s\n", food);
		}
	}

	@Override
	public void sleep() {
		System.out.println("I have a lot of power and energy! I don't need to sleep!! I'm going programming!!!");
	}

	@Override
	public void showInfo() {
		super.showInfo();
		System.out.println("Son's info:");
		System.out.println("\t I'm gonna to be a great programmer in the World!");
	}
}
