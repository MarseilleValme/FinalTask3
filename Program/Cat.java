public class Cat extends Pet {
	public Cat(String name, String commands) {
		super(name, commands);
	}

	@Override
	public void displayCommands() {
		System.out.println("Команды для кошки " + getName() + ": " + getCommands());
	}

	@Override
	public void teachNewCommand(String command) {
		String updatedCommands = getCommands() + "," + command;
		setCommands(updatedCommands);
		System.out.println("Кошка " + getName() + " научилась новой команде: " + command);
	}
}
