package synergy.educational.practice;


public class Main {
	public static void main(String[] args) {
		System.out.println("-------------------PERSON-------------------");

		Person person = new Person();
		person.talk();
		person.eat("Olives");
		person.sleep();
		person.showInfo();

		System.out.println();
		System.out.println("-------------------FATHER-------------------");

		Father father = new Father();

		father.talk();
		father.eat("Olives");
		father.sleep();
		father.goToFish();
		father.showInfo();

		System.out.println();

		System.out.println("--------------------SON--------------------");

		Son son = new Son("Nikita", 22, 75, "Blue");

		son.talk();
		son.eat("Olives");
		son.eat("Banana");
		son.sleep();
		son.goToFish();
		son.playGames();
		son.developProgram();
		son.showInfo();
	}
}
