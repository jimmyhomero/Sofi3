package ec.unomas.elements;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ArchivoUtil {

    public static byte[] convertirArchivoAByteArray(File file) throws IOException {
        byte[] buffer = new byte[(int) file.length()];
        InputStream ios = null;
        try {
            ios = new FileInputStream(file);
            if (ios.read(buffer) == -1) {
                throw new IOException("EOF reached while trying to read the whole file");
            }
        } catch (Exception ex) {
            buffer = null;
        } finally {
            try {
                if (ios != null) {
                    ios.close();
                }
            } catch (IOException e) {
            }
        }
        return buffer;
    }

    public static void stringToFile(String ruta, String contenido) {
        FileOutputStream fop = null;
        File file;
        try {
            file = new File(ruta);
            fop = new FileOutputStream(file);
            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }
            // get the content in bytes
            byte[] contentInBytes = contenido.getBytes();
            fop.write(contentInBytes);
            fop.flush();
            fop.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fop != null) {
                    fop.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

	public static String parsear(String input) {
		String arg = input;
//////    	arg = arg.replace("A", "A");
//////    	arg = arg.replace("e", "E");
//////    	arg = arg.replace("i", "I");
//////    	arg = arg.replace("o", "O");
//////    	arg = arg.replace("u", "U");
//////    	arg = arg.replace("n", "N");
//////    	arg = arg.replace("a", "a");
//////    	arg = arg.replace("e", "e");
//////    	arg = arg.replace("i", "i");
//////    	arg = arg.replace("o", "o");
//////    	arg = arg.replace("u", "u");
//////    	arg = arg.replace("n", "n");
    	return arg;
	}
}