package synergy.educational.practice;

import java.util.ArrayList;

public class Father extends Person {
	protected ArrayList<String> personality;

	public Father() {
		this("John", 45, 65, "Blue");
	}

	public Father(ArrayList<String> personality) {
		this.personality = new ArrayList<>(personality);
	}

	public Father(String name, int age, double weight, String eyeColor, ArrayList<String> skills, ArrayList<String> personality) {
		super(name, age, weight, eyeColor, skills);
		this.personality = new ArrayList<>(personality);
	}

	public Father(String name, int age, double weight, String eyeColor) {
		super(name, age, weight, eyeColor);

		skills.add("Fishing");

		this.personality = new ArrayList<>();
		personality.add("Smart");
		personality.add("Strong");
		personality.add("Kind");
	}

	public ArrayList<String> getPersonality() {
		return personality;
	}

	public void goToFish() {
		System.out.println("I caught a lot of fish!");
	}

	@Override
	public void talk() {
		System.out.println("I'm a father!");
		System.out.println("Where is my son?");
	}

	@Override
	public void eat(String food) {
		super.eat(food);
		System.out.printf("I like %s!\n", food);
	}

	@Override
	public void sleep() {
		System.out.println("I need to sleep more then 8 hours. I'm very tired...");
	}

	@Override
	public void showInfo() {
		super.showInfo();
		System.out.println("Father's info:");
		System.out.printf("\tPersonality: %s\n", personality);
	}
}
