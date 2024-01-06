public class Donkey extends Pack {
	public Donkey(String name, String commands) {
		super(name, commands);
	}

	@Override
	public void displayCommands() {
		System.out.println("Список команд для осла:");
		System.out.println(getCommands());
	}

	@Override
	public void teachNewCommand(String command) {
		String updatedCommands = getCommands() + "," + command;
		setCommands(updatedCommands);
	}
}