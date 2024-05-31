package generic.exam01;

public class Container<S>{
	private S container;

	public S get() {
	return container;
	}

	public void set(S container) {
	this.container = container;
	}
}
