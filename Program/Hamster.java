public class Hamster extends Pet {
	public Hamster(String name, String commands) {
		super(name, commands);
	}

	@Override
	public void displayCommands() {
		System.out.println("Список команд для хомяка:");
		System.out.println(getCommands());
	}

	@Override
	public void teachNewCommand(String command) {
		String updatedCommands = getCommands() + "," + command;
		setCommands(updatedCommands);
	}
}