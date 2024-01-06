public abstract class Animal {
	private String name;
	private String commands;

	public Animal(String name, String commands) {
		this.name = name;
		this.commands = commands;
	}

	public String getName() {
		return name;
	}

	public String getCommands() {
		return commands;
	}

	public void setCommands(String updatedCommands) {
		this.commands = updatedCommands;
	}

	public abstract void displayCommands();

	public abstract void teachNewCommand(String command);
}