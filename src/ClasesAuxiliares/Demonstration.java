/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;

/**
 *
 * @author USUARIO
 */
public class Demonstration {
        public static void main(String[] args) throws Exception{

		SwingUtilities.invokeAndWait(new Runnable(){



			@Override

			public void run() {

				List<String> myWords = new ArrayList<String>();

				myWords.add("bike");

				myWords.add("car");

				myWords.add("cap");

				myWords.add("cape");

				myWords.add("canadian");

				myWords.add("caprecious");

				myWords.add("catepult");



				StringSearchable searchable = new StringSearchable(myWords);

				AutocompleteJComboBox combo = new AutocompleteJComboBox(searchable);

				

				JFrame frame = new JFrame();

				frame.add(combo);

				frame.pack();

				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

				frame.setVisible(true);

			}

			

		});

        }

}
