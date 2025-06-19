package synergy.educational.practice;

import java.util.ArrayList;

public class Person {
	protected String name;
	protected int age;
	protected double weight;
	protected String eyeColor;
	protected ArrayList<String> skills;

	public Person() {
		this("John", 25, 60, "Brown");
	}

	public Person(String name, int age, double weight, String eyeColor) {
		this.name = name;
		this.age = age;
		this.weight = weight;
		this.eyeColor = eyeColor;
		this.skills = new ArrayList<>();
		skills.add("Talk");
		skills.add("Eat");
		skills.add("Sleep");
	}

	public Person(String name, int age, double weight, String eyeColor, ArrayList<String> skills) {
		this(name, age, weight, eyeColor);
		this.skills = new ArrayList<>(skills);
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public double getWeight() {
		return weight;
	}

	public String getEyeColor() {
		return eyeColor;
	}

	public ArrayList<String> getSkills() {
		return skills;
	}

	public void talk() {
		System.out.println("I'm a person!");
	}

	public void eat(String food) {
		System.out.printf("I'm eating: %s\n", food);
	}

	public void sleep() {
		System.out.println("I need to sleep for 8 hours");
	}

	public void showInfo() {
		System.out.println("Person info:");
		System.out.printf("\tName: %s; Age: %d; Weight: %f; EyeColor: %s; Skills: %s;\n", name, age, weight, eyeColor, skills);
	}
}
