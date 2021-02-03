import java.applet.Applet;
import java.awt.Graphics;

public class HelloApplet extends Applet {

	String s;
	
	public void init() {
		s = "Hello Applet!!";
	}
	
	public void paint(Graphics g){
		g.drawString(s, 50, 50);
	}
	
}
