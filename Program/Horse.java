public class Horse extends Pack {
	public Horse(String name, String commands) {
		super(name, commands);
	}

	@Override
	public void displayCommands() {
		System.out.println("Список команд для лошади:");
		System.out.println(getCommands());
	}

	@Override
	public void teachNewCommand(String command) {
		String updatedCommands = getCommands() + "," + command;
		setCommands(updatedCommands);
	}
}