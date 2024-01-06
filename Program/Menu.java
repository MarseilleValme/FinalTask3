import java.util.InputMismatchException;
import java.util.Scanner;

public class Menu {
	private final Data data;
	private final Scanner scanner;

	public Menu(Data data) {
		this.data = data;
		scanner = new Scanner(System.in);
	}

	public void displayMenu() {
		while (true) {
			try {
				System.out.println("Меню:");
				System.out.println("1. Открыть файл с животными");
                System.out.println("2. Добавить новое животное");
				System.out.println("3. Показать список всех животных");
				System.out.println("4. Просмотреть список команд животного");
				System.out.println("5. Обучить животное новой команде");
                System.out.println("6. Сохранить файл с животными");
				System.out.println("7. Выход");
				System.out.print("Выберите пункт меню: ");
				int choice = scanner.nextInt();
				scanner.nextLine();

				switch (choice) {
                    case 1 -> data.loadData();
					case 2 -> addNewAnimal();
					case 3 -> data.displayAllAnimals();
					case 4 -> displayAnimalCommands();
					case 5 -> teachNewCommand();
                    case 6 -> data.saveData();
					case 7 -> {
						System.out.println("Программа завершена.");
						return;
					}
					default -> System.out.println("Неверный выбор. Попробуйте снова.");
				}
			} catch (InputMismatchException e) {
				System.out.println("Ошибка: неверный формат ввода. Попробуйте снова.");
				scanner.nextLine(); // Очистка буфера сканера после ошибочного ввода
			}
		}
	}

	private void addNewAnimal() {
		System.out.println("Введите имя животного:");
		String name = scanner.nextLine();
		System.out.println("Введите список команд через запятую:");
		String commands = scanner.nextLine();

		System.out.println("Выберите класс животного:");
		System.out.println("1. Собака");
		System.out.println("2. Кошка");
		System.out.println("3. Хомяк");
		System.out.println("4. Осёл");
		System.out.println("5. Лошадь");
		int animalClass = scanner.nextInt();
		scanner.nextLine();

		Animal animal;
		switch (animalClass) {
			case 1 -> animal = new Dog(name, commands);
			case 2 -> animal = new Cat(name, commands);
			case 3 -> animal = new Hamster(name, commands);
			case 4 -> animal = new Donkey(name, commands);
			case 5 -> animal = new Horse(name, commands);
			default -> {
				System.out.println("Неверный выбор класса животного.");
				return;
			}
		}

		data.addAnimal(animal);
		System.out.println("Животное успешно добавлено в базу данных.");
	}

	private void displayAnimalCommands() {
		System.out.println("Введите имя животного:");
		String name = scanner.nextLine();

		data.displayAnimalCommands(name);
	}

	private void teachNewCommand() {
		System.out.println("Введите имя животного:");
		String name = scanner.nextLine();
		System.out.println("Введите новые команды через запятую:");
		String command = scanner.nextLine();

		data.teachNewCommand(name, command);
		System.out.println("Команда успешно добавлена для животного.");
	}
}