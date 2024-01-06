public class Dog extends Pet {
	public Dog(String name, String commands) {
		super(name, commands);
	}

	@Override
	public void displayCommands() {
		System.out.println("Список команд для собаки:");
		System.out.println(getCommands());
	}

	@Override
	public void teachNewCommand(String command) {
		String updatedCommands = getCommands() + "," + command;
		setCommands(updatedCommands);
	}
}